import 'package:flutter/material.dart';
import 'package:flutter_application_1/lay%20out/newsapp/newscubit/states.dart';
import 'package:flutter_application_1/modules/search/search_screen.dart';
import 'package:flutter_application_1/shared/components/component.dart';
import 'package:flutter_application_1/shared/network/remote/diohelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'newscubit/cubit.dart';


class NewsScreen_layOut extends StatelessWidget {
  @override
  Widget build(BuildContext context){

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder:(context,state)
      {
        var cubit =NewsCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            title:Text(
              'NewsApp',
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: ()
                {
                  navigateTo(context, SearchScreen(),);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
                onPressed: ()
                {
                  NewsCubit.get(context).changeAppMode();
                },
              ),
            ],
          ),
          body:cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
              items:cubit.bottomNavBarItem,
            onTap: (index)
            {
              cubit.changeBottomNavBar(index);
            },
          ),
        );
      } ,
    );
  }
}
