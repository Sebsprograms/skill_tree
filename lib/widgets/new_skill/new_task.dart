import 'package:flutter/material.dart';
import 'package:skill_tree/models/task.dart';

class NewTask extends StatefulWidget {
  const NewTask({
    super.key,
    required this.task,
    required this.deleteTask,
    required this.editTaskName,
    required this.editTaskExp,
  });

  final Task task;
  final void Function(String id) deleteTask;
  final void Function(String id, String name) editTaskName;
  final void Function(String id, String exp) editTaskExp;

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).appBarTheme.backgroundColor,
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.task.nameController,
              onChanged: (String name) {
                widget.editTaskName(widget.task.id, name);
              },
              decoration: const InputDecoration(
                hintText: "Task Name",
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            width: 100,
            child: TextField(
              controller: widget.task.expController,
              onChanged: (String exp) {
                widget.editTaskExp(widget.task.id, exp);
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Exp Value",
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          IconButton(
              onPressed: () {
                widget.deleteTask(widget.task.id);
              },
              icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
