import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/components/component.dart';
import 'package:flutter_application_1/shared/todocubit/cubit.dart';
import 'package:flutter_application_1/shared/todocubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class HomeLayout extends StatelessWidget{
 var scaffoldKey=GlobalKey<ScaffoldState>();
 var titleController=TextEditingController();
  var timeController=TextEditingController();
  var dateController=TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create:(BuildContext context)=>AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state)
        {
          if(state is AppInsertToDatabaseState){
            Navigator.pop(context);
          }
        },
        builder: (context,state)
        {
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
               AppCubit.get(context).title[AppCubit.get(context).currentIndex],
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body:AppCubit.get(context).newTasks.isEmpty? Center(child: CircularProgressIndicator()):AppCubit.get(context).screens[AppCubit.get(context).currentIndex],
            floatingActionButton:FloatingActionButton(
              onPressed:()
              {
                if(AppCubit.get(context).isBottomSheetShown)
                {
                  if(formKey.currentState!.validate()){
                    AppCubit.get(context).insertToDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text
                    );

                    AppCubit.get(context).changeBottomSheetState(
                        isShow: false,
                        icon:Icons.edit,
                    );
                  }

                }else
                {

                  scaffoldKey.currentState?.showBottomSheet((context)
                  =>Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize:MainAxisSize.min,
                        children: [
                          defultFormField(
                            controller: titleController,
                            keyboardType: TextInputType.text,
                            validator:(String?value)
                            {
                              if(value!.isEmpty)
                              {
                                return "Title Must Not Be Empty";
                              }
                              return null;
                            },
                            prefix: Icons.title,
                            text: "Task Title",
                          ),
                          const SizedBox(height:15.0,),
                          defultFormField(
                            controller: timeController,
                            keyboardType: TextInputType.emailAddress,
                            onTap: ()
                            {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                timeController.text=value!.format(context);
                              });
                            },
                            validator:(String?value)
                            {
                              if(value!.isEmpty)
                              {
                                return "Time Must Not Be Empty";
                              }
                              return null;
                            },
                            prefix: Icons.watch_later_outlined,
                            text: "Task Time",
                          ),
                          const SizedBox(height:15.0,),
                          defultFormField(
                            controller: dateController,
                            keyboardType: TextInputType.datetime,
                            onTap: ()
                            {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2022-09-01'),
                              ).then((value){
                                dateController.text=DateFormat.yMMMd().format(value!);
                              });
                            },
                            validator:(String?value)
                            {
                              if(value!.isEmpty)
                              {
                                return "Date Must Not Be Empty";
                              }
                              return null;
                            },
                            prefix: Icons.calendar_month,
                            text: "Date task",
                          ),
                        ],
                      ),
                    ),
                  ),
                  );

                  AppCubit.get(context).changeBottomSheetState(
                    isShow: true,
                    icon:Icons.add,
                  );
                }

              },
              child:Icon(
                AppCubit.get(context).fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex:AppCubit.get(context).currentIndex,
              items:
              [
                BottomNavigationBarItem(
                  icon:Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ) ,
                BottomNavigationBarItem(
                  icon:Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'Done',
                ) ,
                BottomNavigationBarItem(
                  icon:Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'archived',
                ) ,
              ],
              onTap: (index)
              {
                AppCubit.get(context).changeIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}




