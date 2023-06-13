import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:belajar_pro/view/Widgets/text.form.global.dart';
import 'package:belajar_pro/view/Register.view.dart';
import 'package:http/http.dart' as http;
import 'package:belajar_pro/dbHelper.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void postData(String email, String password) async {
    String url = 'http://belajarpro.online/api/login';
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsonBody = '{"email": "$email", "password": "$password"}';

    try {
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: jsonBody);

      if (response.statusCode == 200) {
        // Request successful
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        if (jsonResponse.containsKey('loggedin')) {
          DatabaseHelper.instance.saveSession(
              jsonResponse['email'],
              int.parse(jsonResponse['uid']),
              jsonResponse['admin'],
              jsonResponse['profilePic'],
              jsonResponse['name']);
          Navigator.pushReplacementNamed(context, '/dashboard');
        } else {
          print("failed");
        }
      } else {
        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
    return; // Return an empty map as the default response
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                  'Login',
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
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                        child: InkWell(
                      onTap: () {
                        postData(emailController.text, passwordController.text);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.zero,
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
                          "Login",
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
                            'Belum punya akun?',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white60),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterView()),
                              );
                            },
                            child: Text(
                              'Daftar',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
