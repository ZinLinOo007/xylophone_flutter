import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());


class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

void playSound(int noteNum) {
  final player = AudioPlayer();
  player.play(AssetSource('note$noteNum.wav'));
}

Expanded buildKey({ required Color color,required int noteNum}) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        playSound(noteNum);
      },
      child: Container(color: color, width: double.infinity, height: 100),
    ),
  );
}

class _XylophoneAppState extends State<XylophoneApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              buildKey(color: Colors.red, noteNum:1),
              buildKey(color: Colors.orange, noteNum: 2),
              buildKey(color: Colors.yellow, noteNum: 3),
              buildKey(color: Colors.green, noteNum: 4),
              buildKey(color: Colors.teal, noteNum: 5),
              buildKey(color: Colors.blue, noteNum: 6),
              buildKey(color: Colors.purple, noteNum: 7),
            ],
          ),
        ),
      ),
    );
  }
}
