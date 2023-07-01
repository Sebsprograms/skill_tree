import 'package:flutter/material.dart';
import 'package:skill_tree/models/task.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
    required this.increaseExp,
    required this.setter,
  });
  final Task task;
  final void Function(String taskId) increaseExp;
  final void Function(void Function()) setter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(task.name),
        ElevatedButton(
          onPressed: () {
            setter(() {
              increaseExp(task.id);
            });
          },
          child: Text("${task.exp}exp"),
        ),
      ],
    );
  }
}
