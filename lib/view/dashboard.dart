import 'package:flutter/material.dart';

final List<String> entries = <String>['Python', 'HTML', 'C++'];
final List<int> colorCodes = <int>[600, 500, 100];

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
      drawer: Drawer(
        width: MediaQuery.of(context).size.width,    
        backgroundColor: Colors.black,    
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(100, 36, 0, 255),
                Color.fromARGB(100, 186, 49, 235),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),          
          child: Column(
            children: [
              Container(
                height: 56,
                alignment: Alignment.topLeft,
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                child: Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ListTile(
                        textColor: Colors.white,
                        title: const Text('Item 1'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        textColor: Colors.white,
                        title: const Text('Item 2'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 36, 0, 255),
              Color.fromARGB(255, 186, 49, 235),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Container(
          margin: EdgeInsets.only(top: 56),
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                child: Text(
                  "Daftar Kursus",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 236, 236, 236),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "List Yang Diikuti ",
                  style: TextStyle(
                      fontSize: 30.0, color: Color.fromARGB(255, 236, 236, 236)),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forum');
                  },
                  child: Text(
                    "Menuju forum",
                    style: TextStyle(
                        color: Color.fromARGB(255, 236, 236, 236),
                        fontSize: 15.0),
                  )),
              Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.all(8),
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: Container(
                            margin: EdgeInsets.all(20),
                            color: Color.fromARGB(255, 33, 139, 226),
                            height: 80,
                            child: Text(
                              entries[index],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 253, 253)),
                            ),
                          ),
                        );
                      })),
              GestureDetector(
                child: Container(        
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 90),
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Icon(Icons.add),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/listcourse');
        
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
