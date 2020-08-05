import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Text('Ask Me Anything'),
            backgroundColor: Colors.blue[900],
          ),
          body: WisdomBall(),
        ),
      ),
    );

class WisdomBall extends StatefulWidget {
  @override
  _WisdomBallState createState() => _WisdomBallState();
}

class _WisdomBallState extends State<WisdomBall> {
  int questionNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FlatButton(
          onPressed: () {
            setState(() {
              questionNumber = Random().nextInt(5) + 1;
            });
          },
          child: Image.asset('images/ball$questionNumber.png'),
        ),
      ),
    );
  }
}
