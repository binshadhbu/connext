import 'package:con_next/services/auth_controller.dart';
import 'package:con_next/auth/welcome_page.dart';
import 'package:con_next/pages/post.dart';
import 'package:con_next/pages/post_neet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class choose extends StatefulWidget {
  choose(String? email);

  @override
  State<choose> createState() => _chooseState();
}

class _chooseState extends State<choose> {
  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Row(
          children: [
            Text(
              'Choose the community',
            ),
            SizedBox(width: 35,),
            GestureDetector(
              onTap: (){
                AuthController.instance.logOut();
              },
              child:Container(
                  width: w*.25,
                  height:h*0.05,
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
                    "Logout",
                    style:TextStyle(
                      fontSize: 25,
                      fontWeight:FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
            ),
            )],
        ),

        centerTitle: true,
      ),
      backgroundColor: Colors.grey[600],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/choose.jpeg'), // set the image path here
            fit: BoxFit.cover, // set the fit property to cover or contain
          ),
        ),
        child: Center(

          child: Container(
            //color: Colors.grey[300],
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                    // Expanded(
                    //   child:FractionallySizedBox(
                    //     widthFactor: 1,
                    //     child:Image.network('https://images.unsplash.com/photo-1501504905252-473c47e087f8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80',
                    //     fit: BoxFit.cover),
                    //   ),
                    // ),
                Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      GestureDetector(
                          onTap:(){
                            Get.to(()=>PostCommentPage());
                            //Navigator.pushNamed(context, '/post');
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
                                "JEE",
                                style:TextStyle(
                                  fontSize: 25,
                                  fontWeight:FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        GestureDetector(
                          onTap:(){
                            Get.to(()=>PostCommentNeet());
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
                                "NEET",
                                style:TextStyle(
                                  fontSize: 25,
                                  fontWeight:FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
