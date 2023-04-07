import 'dart:js';

import 'package:flutter/material.dart';
import 'package:belajar_pro/view/dashboard.dart';
import 'package:belajar_pro/view/listCourse.dart';
import 'package:belajar_pro/view/forum.dart';
import 'package:belajar_pro/view/splash.view.dart';
import 'package:belajar_pro/view/login.view.dart';
import 'package:belajar_pro/view/burgermenu.dart';

void main() => runApp(
  MaterialApp(
    initialRoute: '/splashview',
    routes: {
      '/splashview': (context) => SplashView(),
      '/dashboard': (context) => Dashboard(),
      '/forum': (context) => Forum(),
      '/listcourse': (context) => ListCourse(),
      '/login': (context) => LoginView(),
      '/burgermenu': (context) => const BurgerMenu(),
    },
  ),
);
