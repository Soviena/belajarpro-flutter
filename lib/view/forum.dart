import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:belajar_pro/dbHelper.dart';

class Forum extends StatefulWidget {
  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  TextEditingController questionController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController tagsController = TextEditingController();

  TextEditingController answerController = TextEditingController();

  List data = [];
  var api = "http://belajarpro.online";
  var uid = 0;

  Future<void> getData() async {
    var response = await http.get(Uri.parse(api + "/api/komunitas"));

    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
      });
      return;
    } else {
      throw Exception('Fetch Error');
    }
  }

  Future<void> getuid() async {
    dynamic data = await DatabaseHelper.instance.getSession();
    setState(() {
      uid = data['uid'];
    });
  }

  Widget profilePic(dynamic pic, double size) {
    if (pic == null) {
      return Icon(
        Icons.account_circle,
        size: size,
        color: Colors.grey,
      );
    } else {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "http://belajarpro.online/storage/uploaded/profile/" + pic),
          ),
        ),
      );
    }
  }

  void _showPostDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Post Forum'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Masukkan pertanyaan:'),
              TextFormField(
                controller: questionController,
                decoration: InputDecoration(
                  hintText: 'Pertanyaan',
                ),
              ),
              Text('Deskripsikan pertanyaan nya:'),
              TextFormField(
                controller: descController,
                decoration: InputDecoration(
                  hintText: 'Deskripsi',
                ),
              ),
              Text('Tags:'),
              TextFormField(
                controller: tagsController,
                decoration: InputDecoration(
                  hintText: 'tags',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Post'),
              onPressed: () async {
                var url = Uri.parse(
                    api + '/api/post/add'); // Replace with your API endpoint
                var headers = {
                  'Content-Type': 'application/json'
                }; // Replace with the appropriate headers

                var data = {
                  'uid': uid,
                  'title': questionController.text,
                  'desc': descController.text,
                  'tags': tagsController.text
                }; // Replace with your data

                var response = await http.post(
                  url,
                  headers: headers,
                  body: jsonEncode(data),
                );

                if (response.statusCode == 200) {
                  // Successful request
                  print(response.body);
                  getData();
                  Navigator.of(context).pop();
                } else {
                  // Error occurred
                  print('Request failed with status: ${response.statusCode}');
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showAnswerDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Jawab Pertanyaan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Masukkan jawaban:'),
              TextFormField(
                controller: answerController,
                decoration: InputDecoration(
                  hintText: 'Jawaban',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Jawab'),
              onPressed: () async {
                // String answer = answerController.text;
                // if (answer.isNotEmpty) {
                //   setState(() {
                //     usersQuestion[index].answers.add(answer);
                //   });
                //   answerController.clear();
                //   Navigator.of(context).pop();
                // }
                var url = Uri.parse(
                    api + '/api/comment/add'); // Replace with your API endpoint
                var headers = {
                  'Content-Type': 'application/json'
                }; // Replace with the appropriate headers

                var data = {
                  'pid': index,
                  'uid': uid,
                  'comment': answerController.text
                }; // Replace with your data

                var response = await http.post(
                  url,
                  headers: headers,
                  body: jsonEncode(data),
                );

                if (response.statusCode == 200) {
                  // Successful request
                  print(response.body);
                  getData();
                  Navigator.of(context).pop();
                } else {
                  // Error occurred
                  print('Request failed with status: ${response.statusCode}');
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    getuid();
    super.initState();
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 186, 49, 235),
              Color.fromARGB(255, 36, 0, 255),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Text(
                          "Komunitas",
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Color.fromARGB(255, 255, 253, 253),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(220, 255, 255, 255),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 0,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                profilePic(
                                    data[index]['members']['profilePic'], 20),
                                Text(data[index]['members']['name']),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                data[index]['title'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10),
                            Text(
                              data[index]['deskripsi'],
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Jawaban: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (dynamic answer in data[index]['comments'])
                                  Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          profilePic(
                                              answer['members']['profilePic'],
                                              16),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  answer['members']['name'],
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Divider(),
                                                Text(answer['comment']),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                              ],
                            ),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  _showAnswerDialog(data[index]['id']);
                                },
                                child: Text('Jawab'),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showPostDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
