import 'package:flutter/material.dart';

class ListCourse extends StatefulWidget{
  @override
  _ListCourseState createState() => _ListCourseState();  
}

final List<String> course = <String>['Python', 'HTML', 'C++'];


class _ListCourseState extends State<ListCourse> {
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Course"),          
      ),
      body: Column(
        children: [          
          Container(
            child: Text("Daftar Kursus"),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  child: Text("Cari kursus"),
                ),
                Container(
                  child: Text("cari"),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: course.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Text(course[index]),
                );
              })
            ),          
        ],
      ),
    );
  }
}