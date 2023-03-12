import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/components/component.dart';
import '../../shared/components/component.dart';





class Login_Screen extends StatefulWidget {
  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  var emailController =TextEditingController();

  var passwordController =TextEditingController();

  var formkey =GlobalKey<FormState>();

  bool isPassword=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key:formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                   defultFormField(
                    controller: emailController,
                    keyboardType:TextInputType.emailAddress,
                    text:"Email Address",
                    validator: (value)
                    {
                       if (value!.isEmpty)
                       {
                           return "email address must not empty";
                       }
                       return null;
                    },
                     prefix:Icons.email,

                     
                     function: (String value)
                     {
                      print(value);
                     },
                     onChanged: (String value)
                     {
                      print(value);
                     },
                   ),
                     const SizedBox(
                       height: 15.0,
                     ),
                    defultFormField(
                      controller: passwordController,
                       keyboardType: TextInputType.visiblePassword,
                        validator: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return "password must not be empty";
                          }
                          return null;
                        },
                         prefix: Icons.lock,

                          text:"Password",
                          isPassword: isPassword,
                          function: (String value)
                          {
                              print(value);
                          },
                          onChanged: (String value)
                          {
                            print(value);
                          },
                          suffix: isPassword ?Icons.visibility_off : Icons.visibility,
                          onPressed: ()
                          {
                             setState(() {
                               isPassword=!isPassword;
                             });
                          },
                          ),
                    const SizedBox(
                      height:15.0,
                    ),
                  DefultButton(
                    text: "login",
                    function:(){
                      if(formkey.currentState!.validate())
                      {
                         print(emailController.text);
                        print(passwordController.text);

                      }
                       
                    },
                  ),
                   const SizedBox(
                     height: 15.0,
                   ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an accont",
                        ),
                        TextButton(onPressed: (){ }, child:const Text(
                          "Rigester Now",
                        ), 
                        )
                      ],
                    ),
                      
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}