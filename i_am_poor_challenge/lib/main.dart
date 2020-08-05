import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.amberAccent[200],
      appBar: AppBar(
        backgroundColor: Colors.amberAccent[700],
        title: Text('I Am Poor Challenge'),
      ),
      body: Center(
        child: Image(
          image: AssetImage('images/sun.png'),
        ),
      ),
    ),
  ));
}
