import 'package:flutter/material.dart';
import 'package:belajar_pro/view/Widgets/burgerlist.dart';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState() => _ProfileState();  
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      drawer: BurgerList(),
      body: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.2,
        ),
        child: Stack(
          children: [
          Positioned(
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height * 0.07,
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.15,
              ),
              decoration: BoxDecoration(color: Colors.red),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Nama',
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(),
                            hintText: 'Read Only',
                            )
                          )
                        ),
                        Container(),
                        Container(),
                      ],)
                  )
                ],)
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://picsum.photos/250?image=9')
                  )
                )
              ),
            ),
          ),
          ]
        ),
      ),  
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade800,
        unselectedItemColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 114, 171, 255),        
        currentIndex: 2,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
        onTap: (int index){
          switch (index) {
            case 0:
              Navigator.pushNamed(context, "/forum");
              break;
            case 1:
              Navigator.pushNamed(context, "/dashboard");
              break;
          }
        },
      ),            
    );
  }
}

