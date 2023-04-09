import 'package:belajar_pro/view/Widgets/burgerlist.dart';
import 'package:belajar_pro/view/Widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';

class Article extends StatefulWidget{
  @override
  _ArticleState createState() => _ArticleState();  
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context)  {
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
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),               
                                child: Text("""Python adalah bahasa pemrograman tingkat tinggi. Python menggunakan dynamic typing dan garbage collector...\nSintax untuk mengoutputkan teks kelayar menggunakan fungsi print().""",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Input",style: TextStyle(color: Colors.white),),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(16.0),
                                      color: Color.fromARGB(255, 20, 20, 20),
                                      child: SingleChildScrollView(
                                        child: Text(
                                          'print("Hello World")',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Monospace',
                                            fontSize: 12.0,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text("Input",style: TextStyle(color: Colors.white),),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(16.0),
                                      color: Color.fromARGB(255, 20, 20, 20),
                                      child: SingleChildScrollView(
                                        child: Text(
                                          'Hello World',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Monospace',
                                            fontSize: 12.0,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(bottom: 30, right: 30),
                          child: ElevatedButton(                            
                            style:ButtonStyle(                              
                            backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 141, 34, 241))),
                            child: Text("Selesai"),
                            onPressed: () {
                              Navigator.popAndPushNamed(context, "/coursepage");
                            }, 
                          ),
                        )
                      ],
                    ),
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