import 'package:belajar_pro/view/Widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:belajar_pro/view/Widgets/burgerlist.dart';

class Forum extends StatefulWidget{
  @override
  _ForumState createState() => _ForumState();  
}

class _ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      drawer: BurgerList(),
      body: Column(
        children: [
          Text("Ini di Forum"),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/dashboard');
            }, 
            child: Text("Menuju Dashboard")
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        index: 0,
        unselect: false,
      ),
    );
  }
}