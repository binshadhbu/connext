import 'package:con_next/post_neet.dart';
import 'package:flutter/material.dart';
import 'package:con_next/post.dart';
import 'package:con_next/choose.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/choose',
    routes: {
      '/post': (context) => PostCommentPage(),
      '/choose': (context) => choose(),
      '/postneet': (context) => PostCommentNeet(),
    },
  ));
}

