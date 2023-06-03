import 'package:belajar_pro/view/Widgets/bottomnavbar.dart';
import 'package:belajar_pro/view/Widgets/burgerlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Forum extends StatefulWidget {
  @override
  _ForumState createState() => _ForumState();
}

class UserQuestion {
  String user;
  String question;
  List<String> answers;

  UserQuestion(
      {required this.user, required this.question, required this.answers});
}

class _ForumState extends State<Forum> {
  bool showBorder = false;
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  List<UserQuestion> usersQuestion = [
    UserQuestion(user: "User 1", question: "Kenapa python ...?", answers: []),
    UserQuestion(user: "User 2", question: "Kenapa java ...?", answers: []),
  ];

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
              onPressed: () {
                String user = 'User';
                String question = questionController.text;
                if (question.isNotEmpty) {
                  setState(() {
                    usersQuestion.add(UserQuestion(
                        user: user, question: question, answers: []));
                    showBorder = false;
                  });
                  questionController.clear();
                  Navigator.of(context).pop();
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
              onPressed: () {
                String answer = answerController.text;
                if (answer.isNotEmpty) {
                  setState(() {
                    usersQuestion[index].answers.add(answer);
                  });
                  answerController.clear();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
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
                    itemCount: usersQuestion.length,
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
                                Icon(
                                  Icons.account_circle,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  usersQuestion[index].user,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10),
                            Text(
                              usersQuestion[index].question,
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
                                for (String answer
                                    in usersQuestion[index].answers)
                                  Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.account_circle,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  usersQuestion[index].user,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Divider(),
                                                Text(answer),
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
                                  _showAnswerDialog(index);
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
