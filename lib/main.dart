import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
  }

  List<Widget> buildKey() {
    var colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.purple,
    ];
    var notes = ["DO", "RE", "Mİ", "FA", "SOL", "LA", "Sİ"];
    List<Widget> keys = [];

    for (var i = 0; i < 7; i++) {
      Widget key = Expanded(
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(colors[i]),
          ),
          onPressed: () {
            playSound(i + 1);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                notes[i],
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Icon(
                Icons.music_note_rounded,
                color: Colors.white,
                size: 40,
              ),
            ],
          ),
        ),
      );
      keys.add(key);
    }
    return keys;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buildKey()),
        ),
      ),
    );
  }
}
