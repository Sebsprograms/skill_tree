import 'package:flutter/material.dart';
import 'package:skill_tree/models/task.dart';

class NewTaskDialog extends StatefulWidget {
  const NewTaskDialog({
    super.key,
    required this.skillId,
    required this.addTask,
    required this.setter,
  });

  final String skillId;
  final void Function(String skillId, Task task) addTask;
  final void Function(void Function()) setter;

  @override
  State<NewTaskDialog> createState() => _NewTaskDialogState();
}

class _NewTaskDialogState extends State<NewTaskDialog> {
  final _titleController = TextEditingController();
  final _expController = TextEditingController();

  void createTask() {
    int? exp = int.tryParse(_expController.text);
    if (_titleController.text != "" && exp != null) {
      widget.setter(
        (() => widget.addTask(
              widget.skillId,
              Task(
                exp: exp,
                name: _titleController.text,
              ),
            )),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _expController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: "Title",
            ),
          ),
          TextField(
            controller: _expController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Exp Value",
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: createTask,
                child: const Text("Create Task"),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"))
            ],
          )
        ],
      ),
    );
  }
}
