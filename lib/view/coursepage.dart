import 'package:belajar_pro/view/Widgets/bottomnavbar.dart';
import 'package:belajar_pro/view/Widgets/burgerlist.dart';
import 'package:belajar_pro/view/article.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key, required this.courseId}) : super(key: key);
  final int courseId;

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  List kursus = [];
  String course = "defaultCourse";
  var api = "http://belajarpro.online";

  Future<void> getData() async {
    var responseArticle = await http
        .get(Uri.parse(api + "/api/course/${widget.courseId}/articles"));
    var responseCourse =
        await http.get(Uri.parse(api + "/api/course/${widget.courseId}"));

    if (responseArticle.statusCode == 200) {
      setState(() {
        kursus = jsonDecode(responseArticle.body);
      });
    } else {
      throw Exception('Fetch Error');
    }

    if (responseCourse.statusCode == 200) {
      setState(() {
        print(responseCourse.body);
        course = jsonDecode(responseCourse.body)["name"];
      });
    } else {
      throw Exception('Fetch Error');
    }
    return;
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
                  margin: EdgeInsets.only(bottom: 20),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Daftar materi " + course,
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
                              child: Text((index + 1).toString()),
                            ),
                            title: Text(kursus[index]["chapter"]),
                            trailing: Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            ),
                            textColor: Colors.white,
                            onTap: () {
                              print("Materi " + kursus[index]["chapter"]);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Article(
                                      deskripsi: kursus[index]['deskripsi']),
                                ),
                              );
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
