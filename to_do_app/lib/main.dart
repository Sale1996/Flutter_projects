import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/ProvidedData.dart';
import 'screens/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return ProvidedData();
      },
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
