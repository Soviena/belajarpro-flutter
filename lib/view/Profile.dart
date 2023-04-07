import 'package:flutter/material.dart';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState() => _ProfileState();  
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 33, 139, 226),
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
          icon: Icon(
            Icons.settings,
            color: Color.fromARGB(255, 33, 139, 226),
          ),
          onPressed: () {},
        )
        ],          
      ),
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
    );
  }
}

// Stack (
//     children: [
//     container(),
//     container(
//         child: column(
//         chuldren: [
//             container(
//                 child: column(
//                     children: [
//                         container(),
//                         container(),
//                         container(),
//                     ]
//                 )
//             )
//         ]
//         )
//     ),
//     container(),
//     ]

// )