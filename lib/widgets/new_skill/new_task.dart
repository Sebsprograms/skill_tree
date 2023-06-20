import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

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
    return Row(
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
          width: 8,
        ),
        Expanded(
          child: TextField(
            controller: expController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Exp Value",
            ),
          ),
        ),
      ],
    );
  }
}
