import 'package:flutter/material.dart';
import 'package:belajar_pro/view/Widgets/text.form.global.dart';

class ListCourse extends StatefulWidget{
  @override
  _ListCourseState createState() => _ListCourseState();  
}
final TextEditingController searchController = TextEditingController();

final List<String> course = <String>[
  'Python', 'HTML', 'C++','Python', 'HTML', 'C++',
];

final List<String> images = <String>[
  'assets/images/python.jpg',
  'assets/images/html.png',
  'assets/images/cpp.jpg',
  'assets/images/python.jpg',
  'assets/images/html.png',
  'assets/images/cpp.jpg',
];

class _ListCourseState extends State<ListCourse> {
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
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
                    alignment: Alignment.centerLeft,                   
                    child: Text(
                      "Tambah Kursus",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 255, 253, 253),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: MediaQuery.of(context).size.width * 0.02),                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormGlobal(
                          controller: searchController,
                          text: 'Cari Kursus',
                          obscure: false,
                          textInputType: TextInputType.emailAddress,
                          margins: EdgeInsets.zero,
                          height: 35,
                        )
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color.fromARGB(255, 232, 91, 192),
                        ),
                        child: IconButton(
                          onPressed: () {
                            print("Cari");
                          }, 
                          icon: Icon(Icons.search),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 400,
                    child: ListView.builder(
                      //padding: EdgeInsets.all(8),
                      itemCount: course.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.all(20),
                          height: 120,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 10,
                                bottom: 10,
                                child: Container(
                                  height: 20,
                                  width: 60,
                                  child: ElevatedButton(
                                    style:ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 141, 34, 241),),
                                    ),
                                    onPressed: () {
                                      print("Mengikuti "+course[index]);
                                      Navigator.popAndPushNamed(context, "/dashboard");
                                    }, 
                                    child: Text("Ikuti")     
                                  ),
                                ),
                              ),
                            ]
                          ),
                        );
                      },
                    ),
                  ),
                ),     
              ],
            ),
          ),
        ),
      ),
    );
  }
}