import 'dart:ui';
import 'package:con_next/pages/choose.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:con_next/auth/login_page.dart';
import 'package:con_next/auth/signup_page.dart';
import 'package:con_next/auth/welcome_page.dart';
//
class  AuthController extends GetxController {
  static AuthController instance = Get.find();
  //email,password,name
  late Rx<User?> _user;
  FirebaseAuth auth=FirebaseAuth.instance;
  @override
  void onReady(){
    super .onReady();
    _user=Rx<User?>(auth.currentUser);
    //user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }
  _initialScreen(User? user ){
    if(user==null){
      print("login page");
      Get.offAll(()=>LoginPage());
    }else{
      print("welcome page");
      Get.offAll(()=>choose(user.email));
    }
  }
  Future<void> register(String email,password) async {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About User","User message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Account creation failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );
    }

  }
  Future<void> login(String email,password) async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About Login","Login message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Login failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );
    }

  }
  Future<void> logOut() async {
    await auth.signOut();
  }

}

