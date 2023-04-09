import 'package:belajar_pro/view/article.dart';
import 'package:belajar_pro/view/coursepage.dart';
import 'package:belajar_pro/view/landing.page.dart';
import 'package:flutter/material.dart';
import 'package:belajar_pro/view/dashboard.dart';
import 'package:belajar_pro/view/listCourse.dart';
import 'package:belajar_pro/view/forum.dart';
import 'package:belajar_pro/view/splash.view.dart';
import 'package:belajar_pro/view/login.view.dart';

import 'package:belajar_pro/view/Profile.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splashview',
        routes: {
          '/splashview': (context) => SplashView(),
          '/landing': (context) => LandingPage(),
          '/dashboard': (context) => Dashboard(),
          '/forum': (context) => Forum(),
          '/listcourse': (context) => ListCourse(),
          '/login': (context) => LoginView(),
          '/profile': (context) => Profile(),
          '/coursepage': (context) => CoursePage(),
          '/article': (context) => Article(),
        },
      ),
    );
