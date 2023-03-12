



  import 'package:flutter/material.dart';
  import 'package:flutter_application_1/shared/components/component.dart';
  import 'package:flutter_application_1/shared/todocubit/cubit.dart';
  import 'package:flutter_application_1/shared/todocubit/states.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';

  import '../../shared/components/constant.dart';

  class Done_Tasks_Screen extends StatelessWidget{




  @override
  Widget build(BuildContext context) {


  return BlocConsumer<AppCubit,AppStates>(
  listener:(context,state) {} ,
  builder: (context,state)
  {
  var tasks = AppCubit.get(context).doneTasks;
  return ListView.separated(
  itemBuilder: (context,index)=>buildTasksItem(tasks[index] , context),
  separatorBuilder:(context,index)=>Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey,
  ),
  itemCount: tasks.length,
  );
  },
  );
  }
  }
