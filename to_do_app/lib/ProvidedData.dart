import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Task.dart';
import 'package:to_do_app/widgets/task_tile.dart';

class ProvidedData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: "ajmo"),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  } //sa ovim smo zabranili da se menja ista kod ove liste ukoliko mu pristupimo
  //sa get metodom!!

  void addTask(String taskName) {
    _tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void changeCheckStateOfTask(int taskIndex, bool state) {
    _tasks[taskIndex].isDone = state;
    notifyListeners();
  }

  void delete(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
