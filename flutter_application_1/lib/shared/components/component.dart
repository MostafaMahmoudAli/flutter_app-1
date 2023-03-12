
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/todocubit/cubit.dart';

import '../../modules/web_view/web _view_screen.dart';

Widget DefultButton({
  double width =double.infinity,
  Color color = Colors.blue,
  bool isUpperCase =true,
  required Function() function,
   required String text,
})=>Container(
color: color,
width: width,
child: MaterialButton(
  onPressed: function,

child: Text(
  isUpperCase? text.toUpperCase() : text,
style: const TextStyle(
color: Colors.white,

),
),
),
);

Widget defultFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  Function(String value)?function,
  Function()?onTap,
  ValueChanged <String> ?onChanged,
  required FormFieldValidator<String>validator,
  required  IconData? prefix,
  required String text,
  bool isPassword = false,
  IconData ?suffix,
  Function()?onPressed,
}) => TextFormField(
                    onTap:onTap,
                    controller: controller,
                    keyboardType: keyboardType,
                    onFieldSubmitted: function ,
                    onChanged:onChanged,
                    validator:validator,
                    obscureText:  isPassword,
                    decoration: InputDecoration(
                     labelText:text,
                     border: OutlineInputBorder(),
                     prefixIcon:  Icon(
                         prefix,
                     ),
                     suffixIcon:IconButton(
                      onPressed:onPressed,
                      icon: Icon(
                        suffix,
                       ),
                     ) ,
                     
                     ),  
                    ) ;


Widget buildTasksItem(Map model , context)=>Dismissible(
  key:Key(model['id'].toString()),
  
  onDismissed: (direction) 
  {
  AppCubit.get(context).deleteData(id: model['id'], status:model['status'],);
  },
  child:Padding(
  padding:  EdgeInsets.all(20.0),

  child: Row(

  children:

  [

  CircleAvatar(

  radius: 40.0,

  child: Text(

   " ${model["time"]}",

  style: TextStyle(

  fontWeight:FontWeight.bold,

  ),

  ),

  ),

  SizedBox(

  width: 15.0,

  ),

  Expanded(

    child:   Column(



    mainAxisSize: MainAxisSize.min,



    crossAxisAlignment: CrossAxisAlignment.start,



    children:



    [



    Text(



    "${model["title"]}",



    style: TextStyle(



    fontSize: 20.0,



    fontWeight: FontWeight.bold,



    ),

    ),



    Text(



      "${model["date"]}" ,



    style: TextStyle(



    fontSize: 20.0,



    fontWeight: FontWeight.bold,



    ),

    ),

    ],

    ),

  ),

    SizedBox(

      width: 15.0,

    ),

    IconButton(

        onPressed:()

    {

      AppCubit.get(context).updateData(status: "done", id:model["id"], );

    },

        icon:Icon(

          Icons.check_circle,

          color: Colors.green,

        ),

    ),

    SizedBox(

      width: 15.0,

    ),

    IconButton(

      onPressed:()

      {

        AppCubit.get(context).updateData(status: "Archived", id:model["id"],);

      },

      icon:Icon(

        Icons.archive,

        color: Colors.black45,

      ),

    ),



  ],

  ),

  ),
);


Widget buildArticleItem(article,context)=>InkWell(
  onTap:()
  {
    navigateTo(
      context,
      WebViewScreen(
        article['url'],

      ),
    );
  },
  child:   Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children: [
  
        Container(
  
          width: 120,
  
          height:120,
  
          decoration: BoxDecoration(
  
              borderRadius: BorderRadius.circular(10.0),
  
              image: DecorationImage(
  
                  image:NetworkImage("${article["urlToImage"]}"),
  
                  fit:BoxFit.cover
  
              )
  
          ),
  
        ),
  
        const SizedBox(
  
          width: 20.0,
  
        ),
  
        Expanded(
  
          child: Container(
  
            height: 120.0,
  
            child: Column(
  
              mainAxisAlignment: MainAxisAlignment.start,
  
              crossAxisAlignment: CrossAxisAlignment.start,
  
              children:[
  
                Text(
  
                  "${article["title"]}",
  
                  style:Theme.of(context).textTheme.headline6,
  
                  maxLines:3,
  
                  overflow: TextOverflow.ellipsis,
  
                ),
  
                Text(
  
                  "${article["publishedAt"]}",
  
                  style: TextStyle(
  
                    color: Colors.grey,
  
                  ),
  
                ),
  
              ],
  
            ),
  
          ),
  
        ),
  
      ],
  
    ),
  
  ),
);

Widget myDivider()=>Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 10.0,
    end: 10.0,
  ),
  child:   Container(
    width: double.infinity,
    height: 1.0,
  ),
);

 navigateTo(context,widget)
{
  return  Navigator.push(
    context,
    MaterialPageRoute(
      builder:(context)=>widget,
    ),
  );
}
