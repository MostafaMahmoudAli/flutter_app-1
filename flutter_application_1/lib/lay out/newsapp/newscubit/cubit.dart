import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/lay%20out/newsapp/newscubit/states.dart';
import 'package:flutter_application_1/modules/business/business_screen.dart';
import 'package:flutter_application_1/modules/science/science_Screen.dart';
import 'package:flutter_application_1/modules/settings/settings_Screen.dart';
import 'package:flutter_application_1/modules/sport/sport_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/network/local/cachehelper.dart';
import '../../../shared/network/remote/diohelper.dart';


class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(AppInitialState());

  static NewsCubit get(context)=>BlocProvider.of(context);

  int currentIndex =0;

  List<BottomNavigationBarItem>bottomNavBarItem = [
  BottomNavigationBarItem(
       icon:Icon(
         Icons.business,
       ),
      label: 'Business',
      ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.sports,
      ),
      label: 'Sport',
    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.science,
      ),
      label: 'science',
    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.settings,
      ),
      label: 'Settings',
    ),
  ];

  List<Widget>screens=[
    Business_Screen(),
    Sport_Screen(),
    Science_Screen(),
    Settings_Screen(),
  ];

  void changeBottomNavBar(int index)
  {
    if(index ==1)
    {
      getSport();
    }
    if(index==2)
    {
      getScience();
    }
    currentIndex=index;
    emit(BottomNavState());
  }

  List<dynamic>business=[];

  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query:{
      'country':'eg','category':'business','apiKey':'457457d8388c40dfb67a73842dfc32d6',
    }).then((value){
     // print(value.data.toString());
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error));
    });
  }

  List<dynamic>sport=[];

  void getSport()
  {

      emit(NewsGetSportLoadingState());
      DioHelper.getData(
          url: 'v2/top-headlines',
          query:{
            'country':'eg','category':'sports','apiKey':'457457d8388c40dfb67a73842dfc32d6',
          }).then((value){
        // print(value.data.toString());
        sport = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetSportSuccessState());
      }).catchError((error)
      {
        print(error.toString());
        emit(NewsGetSportErrorState(error));
      });
  }

  List<dynamic>science=[];

  void getScience()
  {

      emit(NewsGetScienceLoadingState());
      DioHelper.getData(
          url: 'v2/top-headlines',
          query:{
            'country':'eg','category':'science','apiKey':'457457d8388c40dfb67a73842dfc32d6',
          }).then((value){
        // print(value.data.toString());
        science = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error)
      {
        print(error.toString());
        emit(NewsGetScienceErrorState(error));
      });


  }

  List<dynamic>search=[];

  void getSearch(String value)
  {

    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
        url: 'v2/everything',
        query:{
          'q':'$value',
          'apiKey':'457457d8388c40dfb67a73842dfc32d6',
        }).then((value){
      // print(value.data.toString());
      search = value.data['articles'];
      print(search[0]['0']['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetSearchErrorState(error));
    });
  }

  bool isDark =false;
  void changeAppMode({ bool?fromShared})
  {
    if(fromShared !=null)
    {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else
    {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value)
      {
        emit(AppChangeModeState());
      });
    }


  }
}
