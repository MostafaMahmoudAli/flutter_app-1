
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return  Scaffold(
    appBar: AppBar(
      elevation: 25.2,
      backgroundColor: Colors.deepOrange,
      leading:Icon(
        Icons.menu,
      ),title:Text('ahmed'
      ) ,
      actions: [
        IconButton(onPressed: (){print("Make search about everythinge");}, icon: Icon(
          Icons.search
        ),) ,
        IconButton(onPressed: (){print("Worring Don't Wasting Your Time ");}, icon: Icon(Icons.notifications
        ), ),  
      ],
    ),
    body: Column(
      children:[
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container( 
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ) ,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: 200.0,
            child: Stack(
              alignment:AlignmentDirectional.topCenter,
              children: [
                Image(
                  image:NetworkImage("https://thumbs.dreamstime.com/b/real-madrid-logo-collection-vector-logos-most-famous-football-teams-world-format-available-ai-illustrator-120473653.jpg,"
                  ), 
                  width: 200.0,
                  height : 200.0,
                  fit: BoxFit.cover,
                   
                ),
                Container(
                  color: Colors.lightBlueAccent.withOpacity(0.5), 
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "The King Of Europe",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize:18.0,
                      ),
                      
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
        );
      

  }

  IconData get newMethod => Icons.menu;

}