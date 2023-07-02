import 'package:flutter/material.dart';
import 'package:skill_tree/models/task.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
    required this.increaseExp,
    required this.setter,
    required this.deleteTask,
    required this.skillId,
  });
  final Task task;
  final void Function(String taskId) increaseExp;
  final void Function(void Function()) setter;
  final void Function(String skillId, String taskId) deleteTask;
  final String skillId;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        color: Theme.of(context).colorScheme.error,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.delete, color: Colors.white),
          ],
        ),
      ),
      onDismissed: (direction) {
        deleteTask(skillId, task.id);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).appBarTheme.backgroundColor,
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
      ),
    );
  }
}
