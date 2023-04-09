import 'package:belajar_pro/view/Widgets/bottomnavbar.dart';
import 'package:belajar_pro/view/Widgets/burgerlist.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget{
  @override
  _CoursePageState createState() => _CoursePageState();  
}

final List<String> kursus = ["Pengenalan", "Tipe data", "Indentasi", "Syntax"];

class _CoursePageState extends State<CoursePage> {
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
                  margin: EdgeInsets.only(bottom: 20),
                  child: Container(
                    alignment: Alignment.centerLeft,                   
                    child: Text(
                      "Daftar materi <nama kursus>",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Color.fromARGB(255, 255, 253, 253),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: kursus.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Text((index+1).toString()),
                            ),
                            title: Text(kursus[index]),
                            trailing: Icon(Icons.arrow_right,color: Colors.white,),
                            textColor: Colors.white,
                            onTap: () {
                              print("Materi "+kursus[index]);
                              Navigator.pushNamed(context, "/article");
                            },
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        index: 0,
        unselect: true,
      ),
    );
  }
}