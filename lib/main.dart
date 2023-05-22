import 'package:con_next/post_neet.dart';
import 'package:flutter/material.dart';
import 'package:con_next/post.dart';
import 'package:con_next/choose.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:con_next/auth/auth_controller.dart';
import 'package:get/get.dart';
import 'auth/splash_screen.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(
//     initialRoute: '/choose',
//     routes: {
//       '/post': (context) => PostCommentPage(),
//       '/choose': (context) => choose(),
//       '/postneet': (context) => PostCommentNeet(),
//     },
//   ));
// }
//






Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value)=>Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

