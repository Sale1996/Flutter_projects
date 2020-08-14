import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskName;
  final Function setCheckValueCallback;
  final Function longPressCallback;

  TaskTile(
      {this.taskName,
      this.isChecked,
      this.setCheckValueCallback,
      this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskName,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: setCheckValueCallback,
      ),
    );
  }
}
