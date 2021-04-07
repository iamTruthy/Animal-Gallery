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
            Image(
              width: 450,
              image:AssetImage ('images/animal$picFrame.jpg'),
            ),
            
          
          
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                child: Text('Next'),
                onPressed: () {
                  cheese();
                  final player = AudioCache();
                  player.play('flip.wav');
                  print('elevated');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: Colors.brown,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  textStyle: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
