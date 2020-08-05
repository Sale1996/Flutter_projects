import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePageStful(),
      ),
    ),
  );
}

class DicePageStful extends StatefulWidget {
  @override
  _DicePageStfulState createState() => _DicePageStfulState();
}

class _DicePageStfulState extends State<DicePageStful> {
  int firstDiceClicked = 3;
  int secondDiceClicked = 2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                rollDices();
                print('Kliknuo si levu kocku, BRAVO!');
              },
              child: Image.asset('images/dice$firstDiceClicked.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                rollDices();
                print('Kliknuo si desnu kocku, nije lose!');
              },
              child: Image.asset('images/dice$secondDiceClicked.png'),
            ),
          ),
        ],
      ),
    );
  }

  void rollDices() {
    setState(() {
      firstDiceClicked = Random().nextInt(6) + 1;
      secondDiceClicked = Random().nextInt(6) + 1;
    });
  }
}
