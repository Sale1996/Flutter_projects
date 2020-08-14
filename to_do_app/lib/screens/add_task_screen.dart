import 'package:flutter/material.dart';
import 'package:to_do_app/ProvidedData.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  String taskName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 20.0,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                taskName = value;
              },
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Provider.of<ProvidedData>(context, listen: false)
                    .addTask(taskName);
                Navigator.pop(context);
              },
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
