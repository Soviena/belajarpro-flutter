// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:belajar_pro/utils/global.colors.dart';

class ButtonGlobal extends StatelessWidget {
  const ButtonGlobal({Key? key, required this.margins, required this.text}) : super(key: key);
  final EdgeInsets margins;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/dashboard');
      },
      child: Container(
        alignment: Alignment.center,
        margin: margins,
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
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
