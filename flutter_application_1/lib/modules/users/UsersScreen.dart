

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user/user_model.dart';



class UsersScreen extends StatelessWidget{

List<UsersModel>Users=[
  UsersModel(id: 1,
   name: "Mostafa Mahmoud" ,
    phone: 0201224648844,
    ),
     UsersModel(id: 2,
   name: "Ahmed Yousry" ,
    phone: 0201207467251,
    ),
     UsersModel(id: 3,
   name: "Misho" ,
    phone: 0201224266553,
    ),
     UsersModel(id: 1,
   name: "Tokka" ,
    phone: 0201151255334,
    ),
     UsersModel(id: 1,
   name: "Abdo fawzy" ,
    phone: 0201281084109,
    ),
    UsersModel(id: 1,
   name: "Mostafa Mahmoud" ,
    phone: 0201224648844,
    ),
     UsersModel(id: 2,
   name: "Ahmed Yousry" ,
    phone: 0201207467251,
    ),
     UsersModel(id: 3,
   name: "Misho" ,
    phone: 0201224266553,
    ),
     UsersModel(id: 1,
   name: "Tokka" ,
    phone: 0201151255334,
    ),
     UsersModel(id: 1,
   name: "Abdo fawzy" ,
    phone: 0201281084109,
    ),
    UsersModel(id: 1,
   name: "Mostafa Mahmoud" ,
    phone: 0201224648844,
    ),
     UsersModel(id: 2,
   name: "Ahmed Yousry" ,
    phone: 0201207467251,
    ),
     UsersModel(id: 3,
   name: "Misho" ,
    phone: 0201224266553,
    ),
     UsersModel(id: 1,
   name: "Tokka" ,
    phone: 0201151255334,
    ),
     UsersModel(id: 1,
   name: "Abdo fawzy" ,
    phone: 0201281084109,
    ),
    
    
];

  UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Users",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
     body: ListView.separated(
      itemBuilder:(context, index)=>BuildUsersModel(Users[index]) ,
     separatorBuilder:(context, index)=>Padding(
       padding: const EdgeInsetsDirectional.only(
        start: 10.0,  end: 10.0,
       ),
       child: Container(
        width: double.infinity,
        height:1.0,
        color: Colors.lightBlueAccent[300],
       ),
     ) ,
      itemCount:Users.length ,
      ),
    );
  }
}

  Widget BuildUsersModel(UsersModel Model)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            "${Model.id},",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${Model.name},",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${Model.phone},",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
