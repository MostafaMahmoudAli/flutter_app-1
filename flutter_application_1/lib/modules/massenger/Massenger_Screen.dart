

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MassengerScreen extends StatelessWidget{
@override
Widget build (BuildContext context){
  return Scaffold(
    backgroundColor: Colors.white,
  appBar: AppBar(
    backgroundColor: Colors.white,
    elevation:0.0,
    titleSpacing: 20.0,
    title:Row(
     children: [
    CircleAvatar(
       radius: 25.0,
       backgroundImage: NetworkImage("https://i1.sndcdn.com/avatars-000754019632-3ewkg8-t500x500.jpg"), 
      ),
      SizedBox(width: 15.0),
        Text(
        "Chats",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.bold
        ),
      ),      
     ], 
    ),
    actions: [
      IconButton(onPressed: (){
        print("Smile");
      },
       icon: CircleAvatar(
        radius: 15.0,
        backgroundColor: Colors.blue,
         child: Icon(
          Icons.camera_alt,
          size: 16.0,
          color: Colors.white,
         ),
       ),
       ),
         IconButton(onPressed: (){
        print("New Massege");
      },
       icon: CircleAvatar(
        radius: 15.0,
        backgroundColor: Colors.blue,
         child: Icon(
          Icons.edit,
          size: 16.0,
          color: Colors.white,
         ),
       ),
       ),
    ],
  ),
  body: Padding(
    padding: const EdgeInsets.all(20.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            padding:const EdgeInsets.all(5.0, ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(width: 15.0,),
                ),
                Text(
                  "Search About  ",
                  style:TextStyle(
                    fontWeight:FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
         const SizedBox(height: 15.0,),
         Container(
          height: 100.0,
           child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index)=> buildStoryItem() ,
              separatorBuilder:  (context,index)=>SizedBox(width: 15.0,),
               itemCount:10, 
               ),
         ),
         SizedBox(height: 20.0,),
         ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
           scrollDirection: Axis.vertical,
          itemBuilder: (context, index) =>BuildChatItem () ,
           separatorBuilder: (context, index) => SizedBox(height: 20.0,) ,
            itemCount: 15,
            ),
        ],
      ),
    ),
  ),
  );
      
}
}


Widget BuildChatItem ()=> Row(
                children: [
                  Stack(
                    alignment:AlignmentDirectional.bottomEnd ,
                    children: [
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundImage:NetworkImage(
                          "https://i1.sndcdn.com/avatars-000754019632-3ewkg8-t500x500.jpg",
                        ) ,
                      ),
                     Padding(
                       padding: const EdgeInsetsDirectional.only(bottom: 3.0,end: 3.0,),
                       child: CircleAvatar(
                       radius: 7.0,
                       backgroundColor: Colors.green[400],
                       ),
                     ),
                    ],
                  ),
                  const SizedBox(height: 8.0,),
                  const Text(
                    "Shakira",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
       
                ],
               );


 Widget buildStoryItem () => Container(
              width:60.0 ,
               child: Column(
                children: [
                  Stack(
                    alignment:AlignmentDirectional.bottomEnd ,
                    children: [
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundImage:NetworkImage(
                          "https://i1.sndcdn.com/avatars-000754019632-3ewkg8-t500x500.jpg",
                        ) ,
                      ),
                     Padding(
                       padding: const EdgeInsetsDirectional.only(bottom: 3.0,end: 3.0,),
                       child: CircleAvatar(
                       radius: 7.0,
                       backgroundColor: Colors.green[400],
                       ),
                     ),
                    ],
                  ),
                  const SizedBox(height: 8.0,),
                  const Text(
                    "Shakira",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
       
                ],
               ),
             );



