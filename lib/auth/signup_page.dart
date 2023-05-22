import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:con_next/auth/auth_controller.dart';
import 'package:flutter/services.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  SignUpPage({Key? key}) : super(key: key);

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
      body: Column(
        children:[
          Container (
            width: w,
            height:h/3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage('assets/signup.png'),//path of image in the login screen
                  fit:BoxFit.cover
              ),
            ),
            child: Column(
              children:[
                SizedBox(height:h*0.18),
                CircleAvatar(
                  radius:50,
                  backgroundImage:AssetImage('assets/profile.png'),
                  backgroundColor: Colors.white70,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20,right: 20),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello",
                  style:TextStyle(
                    fontSize: 40,
                    fontWeight:FontWeight.bold,
                  ),
                ),
                Text("Sign up",
                  style:TextStyle(
                    fontSize: 20,
                    color: Colors.grey[500],
                  ),
                ),
                SizedBox(height: 30,),
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
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
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
                        hintText: "     Password",
                        // prefixIcon: Padding(
                        //   padding: const EdgeInsets.only(left:20),
                        //   child: Icon(Icons.password,color: Colors.grey[500],size: 30,),
                        // ),
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
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  print(emailController.text);
                  AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());
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
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: RichText(text: TextSpan(
              recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
              text:"already have an account?, Login",
              style:  TextStyle(
                fontSize: 20,
                color: Colors.grey[500],
              ),
            )),
          ),
          SizedBox(height:w*0.05),
        ],
      ),

    );
  }
}
