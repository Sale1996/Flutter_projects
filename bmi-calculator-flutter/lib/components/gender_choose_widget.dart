import 'package:flutter/material.dart';
import '../constants.dart';

const iconSize = 50.0;
const spaceBetweenIconAndText = 15.0;

class GenderChooseWidget extends StatelessWidget {
  final IconData genderIcon;
  final String genderName;

  GenderChooseWidget({@required this.genderIcon, @required this.genderName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: iconSize,
        ),
        SizedBox(height: spaceBetweenIconAndText),
        Text(
          genderName,
          style: kTextStyle,
        ),
      ],
    );
  }
}
