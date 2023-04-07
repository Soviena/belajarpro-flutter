import 'package:flutter/material.dart';

class Forum extends StatefulWidget{
  @override
  _ForumState createState() => _ForumState();  
}

class _ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forum"),          
      ),
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
    );
  }
}