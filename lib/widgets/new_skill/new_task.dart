import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key, required this.deleteTask, required this.id});

  final void Function(String id) deleteTask;
  final String id;

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final taskNameController = TextEditingController();
  final expController = TextEditingController();

  @override
  void dispose() {
    taskNameController.dispose();
    expController.dispose();
    super.dispose();
  }

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
              controller: taskNameController,
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
              controller: expController,
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
                widget.deleteTask(widget.id);
              },
              icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
