// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

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
              Color.fromARGB(100, 36, 0, 255),
              Color.fromARGB(100, 186, 49, 235),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),          
        child: Column(
          children: [
            Container(
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
              child: Expanded(
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
            )
          ],
        ),
      ),
    );
  }
}
