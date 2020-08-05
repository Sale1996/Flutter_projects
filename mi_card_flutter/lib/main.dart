import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyCustomApp());
}

class MyCustomApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white12,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('images/joca.png'),
              ),
              Text(
                "Joca neustrasivi Ronin",
                style: TextStyle(
                  fontFamily: 'AmaticSC',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Razotkrivac reptilijanaca",
                style: TextStyle(
                  fontFamily: 'GreatVibes',
                  fontSize: 25.0,
                  color: Colors.white70,
                  letterSpacing: 1.75,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.white70,
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(25.0, 40.0, 25.0, 10.0),
                color: Colors.white70,
                child: ListTile(
                  leading: Icon(
                    Icons.contact_phone,
                    color: Colors.black,
                  ),
                  title: Text(
                    "+381 21 333 555",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                color: Colors.white70,
                child: ListTile(
                  leading: Icon(
                    Icons.contact_mail,
                    color: Colors.black,
                  ),
                  title: Text(
                    "tajni_agent_strane_svetla@gmail.com",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
