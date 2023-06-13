import 'package:flutter/material.dart';
import 'package:belajar_pro/view/Widgets/text.form.global.dart';
import 'package:belajar_pro/dbHelper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterView extends StatefulWidget {
  RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var api = "http://belajarpro.online";

  final TextEditingController userController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 36, 0, 255),
              Color.fromARGB(255, 186, 49, 235),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  TextFormGlobal(
                    controller: userController,
                    text: 'name',
                    obscure: false,
                    textInputType: TextInputType.text,
                    margins: EdgeInsets.symmetric(vertical: 10),
                  ),
                  TextFormGlobal(
                    controller: emailController,
                    text: 'email',
                    obscure: false,
                    textInputType: TextInputType.emailAddress,
                    margins: EdgeInsets.symmetric(vertical: 10),
                  ),
                  TextFormGlobal(
                    controller: passwordController,
                    text: 'password',
                    textInputType: TextInputType.text,
                    obscure: true,
                    margins: EdgeInsets.symmetric(vertical: 10),
                  ),
                  TextFormGlobal(
                    controller: passwordController2,
                    text: 'tulis ulang password',
                    textInputType: TextInputType.text,
                    obscure: true,
                    margins: EdgeInsets.symmetric(vertical: 10),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                      child: InkWell(
                    onTap: () async {
                      var url = Uri.parse(api +
                          '/api/daftar'); // Replace with your API endpoint
                      var headers = {
                        'Content-Type': 'application/json'
                      }; // Replace with the appropriate headers

                      var data = {
                        'email': emailController.text,
                        'password': passwordController.text,
                        'password2': passwordController2.text,
                        'name': userController.text
                      }; // Replace with your data

                      var response = await http.post(
                        url,
                        headers: headers,
                        body: jsonEncode(data),
                      );

                      if (response.statusCode == 200) {
                        // Successful request
                        dynamic jsonData = jsonDecode(response.body);
                        print(jsonData);
                        DatabaseHelper.instance.saveSession(
                            emailController.text,
                            jsonData['id'],
                            "0",
                            "default.png",
                            userController.text);
                        Navigator.pushReplacementNamed(context, '/dashboard');
                      } else {
                        // Error occurred
                        print(
                            'Request failed with status: ${response.statusCode}');
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 232, 91, 192),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                            )
                          ]),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah punya akun?',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white60),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.popAndPushNamed(context, "/login");
                        },
                        child: Text(
                          'Masuk',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
