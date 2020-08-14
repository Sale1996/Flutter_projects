import 'package:flutter/material.dart';
import 'package:to_do_app/Task.dart';
import 'package:to_do_app/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import '../ProvidedData.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskName: Provider.of<ProvidedData>(context).tasks[index].name,
          isChecked: Provider.of<ProvidedData>(context).tasks[index].isDone,
          setCheckValueCallback: (bool value) {
            Provider.of<ProvidedData>(context, listen: false)
                .changeCheckStateOfTask(index, value);
          },
          longPressCallback: () {
            Provider.of<ProvidedData>(context, listen: false).delete(index);
          },
        );
      },
      itemCount: Provider.of<ProvidedData>(context).tasks.length,
    );
  }
}
