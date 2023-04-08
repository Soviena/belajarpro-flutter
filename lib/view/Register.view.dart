import 'package:flutter/material.dart';
import 'package:belajar_pro/utils/global.colors.dart';
import 'package:belajar_pro/view/Widgets/button.global.dart';
import 'package:belajar_pro/view/Widgets/social.register.dart';
import 'package:belajar_pro/view/Widgets/text.form.global.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                    text: 'username',
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
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    child: ButtonGlobal(
                      text: "Register",
                      margins: EdgeInsets.zero
                    ),
                  ),
                  Container(child: SocialRegister()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
