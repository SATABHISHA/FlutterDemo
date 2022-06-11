import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FlatButton(
                color: Colors.red,
                onPressed: () {
                final player = AudioCache();
                player.play('note1.wav');
              }, child: Text('Click Me'),),
              FlatButton(
                color: Colors.orange,
                onPressed: () {
                  final player = AudioCache();
                  player.play('note2.wav');
                }, child: Text('Click Me'),),
              FlatButton(
                color: Colors.yellow,
                onPressed: () {
                  final player = AudioCache();
                  player.play('note3.wav');
                }, child: Text('Click Me'),),
              FlatButton(
                color: Colors.green,
                onPressed: () {
                  final player = AudioCache();
                  player.play('note4.wav');
                }, child: Text('Click Me'),)
            ],
          ),
        ),
      ),
    );
  }
}
