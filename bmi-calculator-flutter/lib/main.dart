import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/material.dart';
import 'pages/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0C1626),
        accentColor: Color(0xFFCC3399),
        scaffoldBackgroundColor: Color(0xFF0C1626),
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => InputPage(),
        "/results": (context) => ResultPage()
      },
    );
  }
}
