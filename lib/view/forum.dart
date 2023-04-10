import 'package:belajar_pro/view/Widgets/bottomnavbar.dart';
import 'package:belajar_pro/view/Widgets/burgerlist.dart';
import 'package:flutter/material.dart';

class Forum extends StatefulWidget{
  @override
  _ForumState createState() => _ForumState();  
}

final List<dynamic> usersQuestion = [
  {
    "user" : "User 1",
    "question" : "Kenapa python ...?"
  },
  {
    "user" : "User 2",
    "question" : "Kenapa java ...?"
  }
];

class _ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      drawer: SafeArea(child: BurgerList()),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 186, 49, 235),
              Color.fromARGB(255, 36, 0, 255),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),       
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    alignment: Alignment.centerLeft,                   
                    child: Text(
                      "Komunitas",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Color.fromARGB(255, 255, 253, 253),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: usersQuestion.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(                        
                        margin: EdgeInsets.all(20),                          
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width *0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(220, 255, 255, 255),
                          boxShadow: [
                            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                          ]                                       
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                usersQuestion[index]["user"],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                usersQuestion[index]["question"],                      
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )
                ),
              ],
            ),
          ),
        ),
      ),      
      bottomNavigationBar: BottomNavBar(index: 0, unselect: false),
    );
  }
}