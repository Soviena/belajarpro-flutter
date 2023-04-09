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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade800,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        selectedFontSize: 12,
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
    );
  }
}