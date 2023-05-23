import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:con_next/services/auth_controller.dart';
import 'package:con_next/auth/signup_page.dart';
import 'package:get/get.dart';


class LoginPage extends StatefulWidget {

  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/choose.jpeg'), // set the image path here
            fit: BoxFit.cover, // set the fit property to cover or contain
          ),
        ),
        child: Column(
          children:[
            SizedBox(height: h*.4,),
            Container(
              margin: const EdgeInsets.only(left: 20,right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello",
                    style:TextStyle(
                      fontSize: h*0.05,
                      fontWeight:FontWeight.bold,
                    ),
                  ),
                  Text("Login",
                    style:TextStyle(
                      fontSize: h*0.02,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: h*0.05,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1,1),
                            color: Colors.grey.withOpacity(0.5),
                          )
                        ]
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration:InputDecoration(
                        hintText: "  Email id",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left:20),
                          child: Icon(Icons.email,color: Colors.grey[500],size: 30,),
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1,1),
                            color: Colors.grey.withOpacity(0.5),
                          )
                        ]
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration:InputDecoration(
                        hintText: "  Password",
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: h*0.02,),
                  Row(
                    children: [
                      Expanded(child: Container(),),
                      Text("forgot password?",
                        style:TextStyle(
                          fontSize: h*0.02,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: h*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    AuthController.instance.login(emailController.text.trim(),passwordController.text.trim());
                  },
                  child: Container (
                    width: w*.4,
                    height:h*0.08,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1,1),
                          color: Colors.grey.withOpacity(0.5),
                        )
                      ],
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image:AssetImage('assets/loginbtn.png'),//path of image in the login screen
                          fit:BoxFit.cover
                      ),
                    ),
                    child:Center(
                      child: Text(
                        "Sign up",
                        style:TextStyle(
                          fontSize: 25,
                          fontWeight:FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "  or",
                  style:TextStyle(
                    fontSize: 30,
                    color: Colors.grey[500],
                  ),
                ),
                Wrap(
                  children: List<Widget>.generate(
                      1,
                          (index){
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: CircleAvatar(
                            radius:40,
                            backgroundColor: Colors.white70,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage('assets/google.png'),
                              backgroundColor: Colors.white,),
                          ),
                        );
                      }
                  ),
                ),
              ],
            ),
            SizedBox(height:w*0.05),
            RichText(text: TextSpan(
              text:"Don't have an account?",
              style:  TextStyle(
                fontSize: 20,
                color: Colors.grey[500],
              ),
              children: [
                TextSpan(
                    text:" Create",
                    style:  TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage())
                )

              ],
            )
            ),
          ],
        ),
      ),
    );
  }
}
