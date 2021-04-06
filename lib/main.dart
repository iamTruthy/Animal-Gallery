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
      child: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: () {
                  print('flip');
                  cheese();
                  final player = AudioCache();
                  player.play('flip.wav');
                },
                child: Image.asset('images/animal$picFrame.jpg'),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ElevatedButton(
                  child: Text('Name'),
                  onPressed: () {
                    print('elevated');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    primary: Colors.brown,
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 20,
                    ),
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
