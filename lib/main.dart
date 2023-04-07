import 'dart:js';

import 'package:flutter/material.dart';
import 'package:belajar_pro/pages/dashboard.dart';
import 'package:belajar_pro/pages/listCourse.dart';
import 'package:belajar_pro/pages/forum.dart';
import 'package:belajar_pro/view/splash.view.dart';
import 'package:belajar_pro/view/login.view.dart';
import 'package:belajar_pro/pages/burgermenu.dart';

void main() => runApp(MaterialApp(initialRoute: '/splashview', routes: {
      '/splashview': (context) => SplashView(),
      '/dashboard': (context) => Dashboard(),
      '/forum': (context) => Forum(),
      '/listcourse': (context) => ListCourse(),
      '/login': (context) => LoginView(),
      '/burgermenu': (context) => const BurgerMenu(),
    }));
