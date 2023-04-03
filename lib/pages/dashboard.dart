import 'package:flutter/material.dart';

final List<String> entries = <String>['Python', 'HTML', 'C++'];
final List<int> colorCodes = <int>[600, 500, 100];

class Dashboard extends StatefulWidget{
  @override
  _DashboardState createState() => _DashboardState();  
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Selamat Malam Username",
          style: TextStyle(
            fontSize: 30.0,
            color: Color.fromRGBO(255, 250, 250, 1),
         ),
        
        ),          
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              "Daftar Kursus",
              style: TextStyle(
                fontSize: 30.0, 
                color: Color.fromARGB(255, 33, 139, 226),
                ),
              
              ),
          ), 
          Container(
            child: Text(
              "List Yang Diikuti ",
               style: TextStyle(fontSize: 30.0,
                color: Color.fromARGB(255, 33, 139, 226)
                ),
              ),
            
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/forum');
            }, 
            child: Text("Menuju forum")
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    color: Color.fromARGB(255, 33, 139, 226),
                    height: 80,
  
                    child: Text(entries[index], 
                    style: TextStyle(color: Color.fromARGB(255, 255, 253, 253)),),
                  ),
                );
              }              
              )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'listcourse');
        }),
    );
  }
}