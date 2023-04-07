import 'package:flutter/material.dart';
import 'package:belajar_pro/pages/dashboard.dart';
import 'package:belajar_pro/pages/listCourse.dart';
import 'package:belajar_pro/pages/forum.dart';
import 'package:belajar_pro/pages/template.dart';
import 'package:belajar_pro/pages/Profile.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/profile',
  routes: {
    '/dashboard': (context) => Dashboard(),
    '/forum': (context) => Forum(),
    '/listcourse': (context) => ListCourse(),
    '/template': (context) => Template(),
    '/profile': (context) => Profile()
  })
);