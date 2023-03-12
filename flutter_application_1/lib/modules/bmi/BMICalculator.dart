
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/bmi_result/BMIResultScreen.dart';

class BMICalculator extends StatefulWidget{
  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  bool isMale = true ;
  double height = 120;
  int weight =40;
  int age = 10;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20.0,
        title: Text(
          "BMICaculator",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
       children: [
         Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: ()
                    {
                        setState(() {
                           isMale = true;
                        });
                    },
                    child: Container(
                      width: double.infinity,
                       decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10.0),
                       color: isMale ? Colors.blue : Colors.grey[400],  
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                       Image(
                        image:AssetImage(
                          "assets/images/Male.png",
                  
                        ),
                         height: 90.0,
                         width: 90.0,
                       ),
                       SizedBox(height: 10.0,),
                       Text(
                        "MALE",
                        style:TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ) ,
                        ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0,),
                Expanded(
                  child: GestureDetector(
                    onTap: ()
                    {
                        setState(() {
                           isMale = false;
                        });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10.0),
                       color:  isMale?   Colors.grey[400]:Colors.blue,  
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                       Image(
                        image:AssetImage(
                          "assets/images/Female.png",
                        ),
                        height: 90.0,
                         width: 90.0,
                       ),
                       SizedBox(height: 10.0,),
                       Text(
                        "FEMALE",
                        style:TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ) ,
                        ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color:Colors.grey[400],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(
                      fontSize:30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                    "${height.round()}",
                    style: TextStyle(
                      fontSize:30.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                       SizedBox(width: 5.0,),
                        Text(
                    "CM",
                    style: TextStyle(
                      fontSize:20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Slider(
                    value: height,
                  max: 230.0,
                  min: 70.0,
                   onChanged:(value){
                   setState(() {
                     height = value ;
                   });
                   },
                   )
                ],
              ),
            ),
          ),
        ),
       Expanded(
         child: Padding(
           padding: const EdgeInsets.all(20.0),
           child: Row(
            children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[400],
                ),
                child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Text(
                            "WEIGHT",
                            style: TextStyle(
                              fontSize:30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      Text(
                            "$weight",
                            style: TextStyle(
                              fontSize:30.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                 SizedBox(height: 5.0,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                       FloatingActionButton(onPressed: ()
                       {
                         setState(() {
                           weight--;
                         });
                       },
                       heroTag:  weight--,
                  mini: true,
                  child: Icon(
                    Icons.remove,
                  ),
                   ),
                   SizedBox(width: 5.0,),
                    FloatingActionButton(onPressed: ()
                    {
                       setState(() {
                           weight++;
                         });
                    },
                     heroTag:  weight++,
                  mini: true,
                  child: Icon(
                    Icons.add,
                  ),
                   ),
                  ],
                 ),
                  ],
                ),
              ),
            ),
             SizedBox(width: 20.0,),
             Expanded(
               child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[400],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Text(
                            "AGE",
                            style: TextStyle(
                              fontSize:30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      Text(
                            "$age",
                            style: TextStyle(
                              fontSize:30.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                 SizedBox(height: 5.0,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                       FloatingActionButton(onPressed: ()
                       {
                         setState(() {
                           age--;
                         });
                       },
                        heroTag:  age--,
                  mini: true,
                  child: Icon(
                    Icons.remove,
                  ),
                   ),
                   SizedBox(width: 5.0,),
                    FloatingActionButton(onPressed: ()
                    {
                       setState(() {
                           age++;
                         });
                    },
                     heroTag:  age++,
                  mini: true,
                  child: Icon(
                    Icons.add,
                  ),
                   ),
                  ],
                 ),
                  ],
                ),
                     ),
             ),
            ],
           ),
         ),
       ),
      Container(
        width: double.infinity,
        color:Colors.blue,
        child: MaterialButton(
          onPressed: ()
          {
            double result = weight / pow(height / 100, 2);
            print(result.round());
            Navigator.push(
              context,
               MaterialPageRoute(
                builder:(context)=>BMIResultScreen(
                  age: age,
                  isMale: isMale,
                  result: result.round(),
                ),
                 ),
               );
          },
          child: Text(
            "CALCULATE",           
            style: TextStyle(
              fontSize: 35.0,
              color: Colors.white,
              height: 2.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          ),
      ),
       ], 
      ),
    );
  }
}