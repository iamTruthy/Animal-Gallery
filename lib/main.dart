import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

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
    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10,10,10,20),
            child: Image(
              width: 400,
              image: AssetImage('images/animal$picFrame.jpg'),
            ),
          ),
          
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                child: Icon(Icons.arrow_forward_ios_rounded),
                onPressed: () {
                  cheese();
                  final player = AudioCache();
                  player.play('flip.wav');
                },
                  backgroundColor: Colors.brown,
                  ),
                ),
              ),
    
      

          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  onPressed: () {

                  },
                  child: Icon(Icons.arrow_back_ios_rounded),
                  backgroundColor: Colors.brown,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
