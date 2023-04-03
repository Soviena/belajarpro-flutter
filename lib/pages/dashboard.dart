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
      appBar: AppBar(
        title: Text(
          "Selamat Malam Username",
          style: TextStyle(
            fontSize: 30.0,
            color: Color.fromRGBO(255, 250, 250, 1),
          ),
        ),
      ),
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
                height: 30,
                width: 200,
                child: Icon(Icons.add),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 141, 141, 141),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/listcourse');

              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        return print("Pilih Course");
      }),
    );
  }
}
