import 'package:con_next/post_neet.dart';
import 'package:flutter/material.dart';
import 'package:con_next/post.dart';
import 'package:con_next/choose.dart';

void main() => runApp(MaterialApp(
  initialRoute:'/choose',
    routes: {
      '/post' : (context) => PostCommentPage(),
      '/choose': (context) => choose(),
      '/postneet': (context) => PostCommentNeet(),
    },
  ));

