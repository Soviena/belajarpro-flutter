import 'dart:convert';
import 'package:belajar_pro/view/Widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:belajar_pro/view/Widgets/burgerlist.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List data = [];
  var api = "http://belajarpro.online";

  Future<List> getData() async {
    var response = await http.get(Uri.parse(api + "/api/course/all"));

    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
      });
      print(data);
      return jsonDecode(response.body);
    } else {
      throw Exception('Fetch Error');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
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
                        border: Border(bottom: BorderSide(width: 1))),
                    child: Text(
                      "Daftar Kursus",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 350,
                    child: ListView.builder(
                      //padding: EdgeInsets.all(8),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/coursepage');
                          },
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                height: 80,
                                width: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${api}/storage/uploaded/Course/${data[index]['img']}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 250,
                                child: Text(data[index]['name']),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 226, 230, 233),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40))),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/listcourse');
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
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
      ),
      bottomNavigationBar: BottomNavBar(
        index: 1,
        unselect: false,
      ),
    );
  }
}
