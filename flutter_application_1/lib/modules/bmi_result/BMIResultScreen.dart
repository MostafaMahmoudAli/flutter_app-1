import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget{
  final int result ;
  final bool isMale ;
  final int age ;
  BMIResultScreen({
    required this.result,
    required this.age,
    required this.isMale
  });
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title:Text(
          "BMIResult",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight:FontWeight.bold, 
          ),
        ) ,
        leading: IconButton(
          onPressed: ()
          {
              Navigator.pop(context);
          },
           icon: Icon(
            Icons.keyboard_arrow_left,
           ),
          ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " Gender : ${ isMale ? "Male" : "Female"} ",
              style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              ),
            ),
             Text(
              " Result : $result ",
              style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              ),
            ),
             Text(
              " Age :$age",
              style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

}