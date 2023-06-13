import 'package:belajar_pro/view/Widgets/burgerlist.dart';
import 'package:belajar_pro/view/Widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:markdown/markdown.dart' as md;
import 'dart:convert';

class Article extends StatefulWidget {
  const Article({Key? key, required this.deskripsi}) : super(key: key);
  final String deskripsi;
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  String style = '''

    <style>
        code {
            display: block;
            padding: 9.5px;
            margin: 0 0 10px;
            font-size: 13px;
            line-height: 1.42857143;
            color: #aaffaa;
            word-break: break-all;
            word-wrap: break-word;
            background-color: #555555;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
            width: 100%;
            border: 1px solid #ddd;
        }

        th, td {
            text-align: left;
            padding: 16px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:nth-child(odd) {
            background-color: #ffffff;
        }

        .tab-content {
            padding-top: 10px;
            margin-left:30px;
            max-width: 1200px;
            background-color:rgb(255, 241, 241) ;
            border-radius: 10px
        }
    </style>
  ''';
  String htmlContent = "none";
  void decodeMD() {
    List<int> bytes = base64.decode(widget.deskripsi);
    setState(() {
      htmlContent = (md.markdownToHtml(utf8.decode(bytes))) + style;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    decodeMD();
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
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 107, 29, 136),
          Color.fromARGB(255, 27, 14, 110),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Halaman Artikel",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 255, 253, 253),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.68,
                        child: Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              child: Html(
                                data: htmlContent,
                                style: {
                                  "body": Style(
                                    color: Colors
                                        .white, // Change the text color here
                                  ),
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(bottom: 30, right: 30),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 141, 34, 241))),
                          child: Text("Selesai"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
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
