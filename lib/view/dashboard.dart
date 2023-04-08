import 'package:flutter/material.dart';
import 'package:belajar_pro/view/Widgets/burgerlist.dart';


final List<String> entries = <String>[
  'Python', 'HTML', 'C++','Python', 'HTML', 'C++',];

final List<String> images = <String>[
  'assets/images/python.jpg',
  'assets/images/html.png',
  'assets/images/cpp.jpg',
  'assets/images/python.jpg',
  'assets/images/html.png',
  'assets/images/cpp.jpg',
];

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 186, 49, 235),
              Color.fromARGB(255, 36, 0, 255),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 56),       
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  alignment: Alignment.centerLeft,                   
                  child: Text(
                    "Selamat Pagi Username",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 255, 253, 253),
                    ),
                  ),
                ),
              ),
              Container(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1)
                    )
                  ),
                  child: Text(
                    "Daftar Kursus",
                    style: TextStyle(
                      color: Colors.white
                    ),                      
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  //padding: EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/listcourse');
                      },
                      child: Container(
                        margin: EdgeInsets.all(20),
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 250,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                image: DecorationImage(
                                  image: AssetImage(images[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/listcourse');
                },
                child: Container(        
                  margin: EdgeInsets.fromLTRB(30, 50, 30, 0),
                  height: 40,
                  width: 250,
                  child: Icon(Icons.add),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade800,
        unselectedItemColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 114, 171, 255),        
        currentIndex: 1,
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
            case 2:
              Navigator.pushNamed(context, "/profile");
              break;
          }
        },
      ),      
    );
  }
}
