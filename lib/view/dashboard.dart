import 'package:flutter/material.dart';

final List<String> entries = <String>['Python', 'HTML', 'C++'];

final List<String> images = <String>[
  'assets/images/python.jpg',
  'assets/images/html.png',
  'assets/images/cpp.jpg'
];

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(99, 165, 25, 216),
          Color.fromARGB(255, 62, 5, 194)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      // Handle menu button press
                    },
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () {
                      // Handle message button press
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Selamat Pagi Username",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 255, 253, 253),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/forum');
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    decoration: new InputDecoration(
                        labelText: "Daftar Kursus",
                        enabled: false,
                        
                        ),
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
                                fit: BoxFit.fill,
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
                margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                height: 65,
                width: 240,
                child: Icon(Icons.add),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color.fromARGB(255, 107, 107, 107),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
