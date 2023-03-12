import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/counter/cubit/cubit.dart';
import 'package:flutter_application_1/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    return BlocProvider(
      create:(BuildContext context)=>CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener:(context,state)
        {
         /* if(state is CounterMinusState) print('Minus state${state.counter}');
          if(state is CounterPlusState) print('Plus state${state.counter}');
          */

        },
        builder: (context,state)
        {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "counter",
                style: TextStyle(
                    fontSize:30.0,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: ()
                    {
                      CounterCubit.get(context).minus();
                    },
                    child: Text(
                      "Minus",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "${CounterCubit.get(context).counter}",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: ()
                    {
                      CounterCubit.get(context).plus();
                    },
                    child: Text(
                      "plus",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}