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
        decoration: BoxDecoration(
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.circle,
                    color: Colors.blue,
                    size: 50,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Super namapengguna", style: TextStyle(color: Colors.white),),
                        Text("Level 3", style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ],
              )
            ),
            Expanded( 
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    textColor: Colors.white,
                    title: const Text('Item 1'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    textColor: Colors.white,
                    title: const Text('Logout'),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/splashview");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
