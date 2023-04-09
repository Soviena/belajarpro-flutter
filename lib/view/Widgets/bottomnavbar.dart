// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key, required this.index, required this.unselect}) : super(key: key);
  final int index;
  bool unselect = false;
  Color _colors = Colors.blue;
  double fs = 14;

  @override
  Widget build(BuildContext context) {
    if (unselect) {
      _colors = Colors.white;
      fs = 12;
    }
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          boxShadow: [                                                               
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),       
          ],     
        ),
        
        child: ClipRRect(
          borderRadius: BorderRadius.only(                                           
          topLeft: Radius.circular(30.0),                                            
          topRight: Radius.circular(30.0),
          ),            
          child: BottomNavigationBar(
            backgroundColor: Colors.grey.shade800,
            unselectedItemColor: Colors.white,
            selectedItemColor: _colors,
            selectedFontSize: fs,
            iconSize: 30,
            currentIndex: index,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.forum),
                label: 'Forum',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              )
            ],
            onTap: (int index){
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, "/forum");
                  break;
                case 1:
                  Navigator.pushNamed(context, "/dashboard");
                  break;              
                case 2:
                  Navigator.pushNamed(context, "/profile");
                  break;
              }
            },
          ),
        ),
      );
  }
}
