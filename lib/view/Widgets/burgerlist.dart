// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BurgerList extends StatelessWidget {
  const BurgerList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      backgroundColor: Colors.black,
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(100, 186, 49, 235),
          Color.fromARGB(100, 36, 0, 255),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          children: [
            Container(
              //tombol back
              height: 56,
              alignment: Alignment.topLeft,
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(children: [
                    Container(
                        child: const Icon(
                      Icons.circle,
                      color: Colors.blue,
                      size: 50,
                    )),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/dashboard");
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Super namapengguna",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text("Level 3",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/dashboard");
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: const Icon(
                      Icons.mail_outline,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, "/dashboard");
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))),
                child: const Text(
                  "Belajar-Pro+",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, "/dashboard");
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))),
                child: const Text(
                  "Profil",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, "/dashboard");
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))),
                child: const Text(
                  "Pengaturan",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, "/splashview");
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))),
                child: const Text(
                  "Keluar akun",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
