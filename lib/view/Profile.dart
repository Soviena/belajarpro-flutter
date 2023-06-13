import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:belajar_pro/view/Widgets/burgerlist.dart';
import 'package:belajar_pro/dbHelper.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String nama = "noName";
  String profilePic = "https://placeimg.com/50/50/any";

  Future<void> getDb() async {
    dynamic data = await DatabaseHelper.instance.getSession();
    setState(() {
      nama = data['name'];
      profilePic = "http://belajarpro.online/storage/uploaded/profile/" +
          data['profilePic'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      drawer: BurgerList(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 36, 0, 255),
              Color.fromARGB(255, 186, 49, 235),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.2,
        ),
        child: Stack(children: [
          Positioned(
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height * 0.07,
            child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15,
                ),
                child: Column(
                  children: [
                    Container(
                        child: Column(
                      children: [
                        Container(
                            padding:
                                EdgeInsets.only(left: 16, top: 25, right: 16),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextField(
                                decoration: InputDecoration(
                              labelText: 'Nama',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                              )),
                              hintText: nama,
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ))),
                        Container(
                            padding:
                                EdgeInsets.only(left: 16, top: 25, right: 16),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextField(
                                decoration: InputDecoration(
                              labelText: 'Level',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                              )),
                              hintText: 'Level 3',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ))),
                        Container(
                            padding:
                                EdgeInsets.only(left: 16, top: 25, right: 16),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Tipe User',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.white,
                                )),
                                hintText: 'Pelajar',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                          height: 40,
                          width: 250,
                          child: Icon(Icons.add),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ))
                  ],
                )),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(profilePic),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade800,
        unselectedItemColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 114, 171, 255),
        currentIndex: 2,
        iconSize: 30,
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
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, "/forum");
              break;
            case 1:
              Navigator.pushNamed(context, "/dashboard");
              break;
          }
        },
      ),
    );
  }
}
