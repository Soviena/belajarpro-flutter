import 'package:flutter/material.dart';
import 'package:belajar_pro/pages/dashboard.dart';
import 'package:belajar_pro/pages/listCourse.dart';
import 'package:belajar_pro/pages/forum.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/listcourse',
  routes: {
    '/dashboard': (context) => Dashboard(),
    '/forum': (context) => Forum(),
    '/listcourse': (context) => ListCourse(),
  })
);