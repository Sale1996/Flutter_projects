import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  BottomButton({@required this.onTap, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          buttonTitle,
          style: kLagreButtonTextStyle,
        )),
        color: kCALCULATE_BUTTON_COLOR,
        margin: EdgeInsets.only(top: 15.0),
        width: double.infinity,
        height: kCALCULATE_BUTTON_HEIGHT,
      ),
    );
  }
}
