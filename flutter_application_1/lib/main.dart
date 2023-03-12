
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/lay%20out/newsapp/newscubit/states.dart';
import 'package:flutter_application_1/lay%20out/todoapp/Todo_Layout.dart';
import 'package:flutter_application_1/shared/blocobserve.dart';
import 'package:flutter_application_1/shared/network/local/cachehelper.dart';
import 'package:flutter_application_1/shared/network/remote/diohelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'lay out/newsapp/newscubit/cubit.dart';





void main(){
  BlocOverrides.runZoned(
       () async {
         WidgetsFlutterBinding.ensureInitialized();
         DioHelper.init();
        await CacheHelper.init();
        bool?isDark=CacheHelper.getBoolean(key: "isDark");
         runApp(MyApp(isDark));

     },
     blocObserver: MyBlocObserver(),

   );



}
class MyApp extends StatelessWidget{

  final bool?isDark;
  MyApp(this.isDark);
  @override
  Widget  build(BuildContext context){
    return BlocProvider(
      create: (BuildContext context)=>NewsCubit()..changeAppMode(fromShared:isDark)..getBusiness(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener:(context,state){} ,
        builder: (context,state)
        {
          return MaterialApp(
            theme:ThemeData(
              primarySwatch:Colors.green,
              bottomNavigationBarTheme:BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: HexColor('#25D366'),
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
                elevation: 50.0,
              ) ,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme:AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                titleTextStyle:TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarBrightness: Brightness.dark,

                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
              ),
              textTheme:TextTheme(
                headline6:TextStyle(
                  fontWeight:FontWeight.w700,
                  fontSize:20.0,
                  color:Colors.black,
                ),
              ),
            ),
            darkTheme:ThemeData(
              primarySwatch: Colors.green,
              appBarTheme:AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                titleTextStyle:TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor:HexColor('#17202a'),
                  statusBarBrightness: Brightness.light,
                ),
                backgroundColor: HexColor('#17202a'),
                elevation: 0.0,
              ),
              scaffoldBackgroundColor: HexColor('#17202a'),
              bottomNavigationBarTheme:BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: HexColor('#25D366'),
                unselectedItemColor: Colors.grey,
                backgroundColor: HexColor('#17202a'),
                elevation: 50.0,
              ) ,
              textTheme:TextTheme(
                headline6:TextStyle(
                  fontWeight:FontWeight.w700,
                  fontSize:20.0,
                  color:Colors.white,
                ),
              ),
            ) ,
            themeMode:ThemeMode.light,//NewsCubit.get(context).isDark ? ThemeMode.dark:ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home:  HomeLayout(),
          );
        }
      ),
    );
  }
}


   



