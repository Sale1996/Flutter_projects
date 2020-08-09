import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/widgets/rounded_btn.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(animationController);
    animationController.forward();
//    animation.addStatusListener((status) {
//      if (status == AnimationStatus.completed)
//        animationController.reverse(from: 1.0);
//      else if (status == AnimationStatus.dismissed)
//        animationController.forward();
//    });
    //animationController.reverse(from: 1.0);
    animationController.addListener(() {
      setState(() {}); //ukoliko ovo ne uradimo, GUI se nece refreshovati
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose(); //NIKAD NE ZABORAVI OVO DA URADIS
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TextLiquidFill(
                  text: 'Flash Chat',
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  boxBackgroundColor: Colors.white,
                  boxHeight: 50,
                  boxWidth: 250.0,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              backgroundColor: Colors.lightBlueAccent,
              btnName: 'Log In',
              btnFunction: () {
                //Go to login screen.
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              backgroundColor: Colors.blueAccent,
              btnName: 'Register',
              btnFunction: () {
                //Go to login screen.
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
