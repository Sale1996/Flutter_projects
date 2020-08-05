import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Widget buildExpandWidghetWithSoundButton(int buttonNumber, Color color) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(buttonNumber);
        },
        child: Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildExpandWidghetWithSoundButton(1, Colors.blueGrey),
              buildExpandWidghetWithSoundButton(2, Colors.lightBlueAccent),
              buildExpandWidghetWithSoundButton(3, Colors.red),
              buildExpandWidghetWithSoundButton(4, Colors.green),
              buildExpandWidghetWithSoundButton(5, Colors.yellow),
              buildExpandWidghetWithSoundButton(6, Colors.purple),
              buildExpandWidghetWithSoundButton(7, Colors.orange),
            ],
          ),
        ),
      ),
    );
  }
}
