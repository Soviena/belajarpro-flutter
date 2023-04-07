import 'package:flutter/material.dart';

class Template extends StatefulWidget{
  @override
  _TemplateState createState() => _TemplateState();  
}

class _TemplateState extends State<Template> {
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),          
      ),
      body: Column(
        children: [
          Text("Ini di dashboard"),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/forum');
            }, 
            child: Text("Menuju forum")
          )
        ],
      ),
    );
  }
}