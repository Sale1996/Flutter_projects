import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color backgroundColor;
  final String btnName;
  final Function btnFunction;

  RoundedButton(
      {@required this.backgroundColor,
      @required this.btnName,
      @required this.btnFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: btnFunction,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            btnName,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
