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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade800,
        unselectedItemColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 114, 171, 255),        
        currentIndex: 0,
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
        onTap: (int index){
          switch (index) {
            case 1:
              Navigator.pushNamed(context, "/dashboard");
              break;
            case 2:
              Navigator.pushNamed(context, "/profile");
              break;
          }
        },
      ),      
    );
  }
}