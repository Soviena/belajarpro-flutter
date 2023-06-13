import 'dart:async';
import 'package:flutter/material.dart';
import 'package:belajar_pro/utils/global.colors.dart';
import 'package:belajar_pro/dbHelper.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool loggedIn = false;

  Future<void> getDb() async {
    bool db = await DatabaseHelper.instance.getLogin();
    loggedIn = db;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDb();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      if (loggedIn) {
        Navigator.popAndPushNamed(context, "/dashboard");
      } else {
        Navigator.popAndPushNamed(context, "/landing");
      }
    });
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Image.asset(
                'assets/images/BelajarPro.png',
                width: 280,
                height: 250,
              ),
            ),
            Text(
              'Belajar Pro',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
