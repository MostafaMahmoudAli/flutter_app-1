import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/network/local/cachehelper.dart';
import 'package:flutter_application_1/shared/todocubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import '../../modules/archived tasks/archived_tasks_screen.dart';
import '../../modules/done tasks/done_tasks_screen.dart';
import '../../modules/new tasks/new_tasks_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    New_Tasks_Screen(),
    Done_Tasks_Screen(),
    Archived_Tasks_Screen(),
  ];
  List<String> title = [
    "New Tasks",
    "Done Tasks",
    "Archived Tasks",
  ];

  late Database database;

  List<Map> newTasks = [];

  List<Map> doneTasks = [];

  List<Map> archivedTasks = [];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(APPChangeBottomSheetState());
  }

  void updateData({
    required status,
    required int id,
  }) {
    database.rawUpdate("UPDATE tasks SET status = ?  WHERE id = ?",
        ["$status", "$id"]).then((value) {
      getDataFromDatabase(database);
      emit(AppUpDateDatabaseState());
    });
  }

  void deleteData({required String status,required int id})  {
    database.rawDelete(
      "DELETE FROM tasks WHERE id = ? ",
      ["id"],
    ).then((value){

      if(status == 'new')
      {
        newTasks.removeAt(id);
      }
      else if (status == 'done'){
        doneTasks.removeAt(id);
      }
      else{
        archivedTasks.removeAt(id);
      }
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
                "CREATE TABLE Tasks(id INTEGER PRIMARY KEY, title TEXT ,date TEXT,time TEXT ,status TEXT)")
            .then((value) {
          print("Database Created");
        }).catchError((error) {
          print("Error When Creating Table ${error.toString()}");
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);

        print("Database Opened");
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) {
    database.transaction((txn) =>
        txn.rawInsert(
                    "INSERT INTO tasks(title,date,time,status)VALUES('$title','$date','$time','new')")
                .then((value) {
              emit(AppInsertToDatabaseState());
              getDataFromDatabase(database);
              print("$value inserted successfully");
            }).catchError((error) {
              print("Error When Inserting new table ${error.toString()}");
            }))
        .catchError((error) {
      print("Error When Inserting new table ${error.toString()}");
    });
  }

  void getDataFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];

    database.rawQuery('SELECT*FROM tasks').then((value) {
      value.forEach((element) {
        if (element["status"] == 'new') {
          newTasks.add(element);
        } else if (element["status"] == 'done') {
          doneTasks.add(element);
        } else {
          archivedTasks.add(element);
        }
      });
      emit(APPGetDataFromDatabaseState());
    });
  }

}

