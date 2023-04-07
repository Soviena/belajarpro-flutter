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
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(99, 165, 25, 216),
                Color.fromARGB(255, 62, 5, 194)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Belajar Pro',
                  style: TextStyle(
                    color: GlobalColors.mainColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                'Login to your account',
                style: TextStyle(
                  color: GlobalColors.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              TextFormGlobal(
                controller: userController,
                text: 'username',
                obscure: false,
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              TextFormGlobal(
                controller: emailController,
                text: 'email',
                obscure: false,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              TextFormGlobal(
                controller: passwordController,
                text: 'password',
                textInputType: TextInputType.text,
                obscure: true,
              ),
              Container(
                child: ButtonGlobal(),
                margin: EdgeInsets.symmetric(vertical: 25),
              ),
              Container(child: SocialRegister()),
            ],
          ),
        ),
      ),
    );
  }
}
