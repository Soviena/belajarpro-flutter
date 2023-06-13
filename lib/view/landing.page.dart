import 'package:flutter/material.dart';
import 'package:belajar_pro/utils/global.colors.dart';
import 'package:belajar_pro/view/Widgets/social.register.dart';
import 'package:belajar_pro/view/Register.view.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.1,
              ),
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    'Belajar-Pro',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Belajar Programming',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.1),
              child: Column(
                children: [
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterView()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 232, 91, 192),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                              )
                            ]),
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: SocialRegister(),
                  ),
                  // Container(
                  //   child: Text(
                  //     'Login nanti',
                  //     style: TextStyle(color: Colors.white, fontSize: 14),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
