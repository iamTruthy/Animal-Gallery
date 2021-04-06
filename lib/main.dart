import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Gallery',
              style: TextStyle(
                fontFamily: 'NewTegomin',
                fontSize: (25.0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.brown,
        ),
        body: Picture(),
      ),
    );
  }
}

class Picture extends StatefulWidget {
  @override
  _PictureState createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  int picFrame = 1;

  void cheese() {
    setState(() {
      picFrame = Random().nextInt(25) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                cheese();
              },
              child: Image.asset('images/animal$picFrame'),
            ),
          ),
        ],
      ),
    );
  }
}
