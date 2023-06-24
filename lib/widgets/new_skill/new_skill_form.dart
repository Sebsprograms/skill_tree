import 'package:flutter/material.dart';
import 'package:skill_tree/models/skill.dart';
import 'package:skill_tree/models/task.dart';
import 'package:skill_tree/widgets/new_skill/new_task.dart';

class NewSkillForm extends StatefulWidget {
  const NewSkillForm({
    super.key,
    required this.addSkill,
  });

  final void Function(Skill skill) addSkill;

  @override
  State<NewSkillForm> createState() => _NewSkillFormState();
}

class _NewSkillFormState extends State<NewSkillForm> {
  final skillNameController = TextEditingController();
  List<Task> tasks = [];
  @override
  void initState() {
    super.initState();
    tasks.add(Task());
  }

  addTask() {
    setState(() {
      tasks.add(Task());
    });
  }

  editTaskName(String id, String name) {
    setState(() {
      tasks = tasks.map((task) {
        if (task.id == id) {
          task.name = name;
        }
        return task;
      }).toList();
    });
  }

  editTaskExp(String id, String exp) {
    setState(() {
      tasks = tasks.map((task) {
        if (task.id == id) {
          task.exp = int.tryParse(exp) ?? 0;
        }
        return task;
      }).toList();
    });
  }

  deleteTask(String id) {
    setState(() {
      tasks.removeWhere((task) => task.id == id);
    });
  }

  @override
  void dispose() {
    skillNameController.dispose();
    for (Task task in tasks) {
      task.nameController.dispose();
      task.expController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: skillNameController,
              decoration: const InputDecoration(
                hintText: "Skill Name",
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  ...tasks
                      .map((task) => NewTask(
                            deleteTask: deleteTask,
                            editTaskName: editTaskName,
                            editTaskExp: editTaskExp,
                            task: task,
                          ))
                      .toList(),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton.icon(
                    onPressed: addTask,
                    icon: const Icon(Icons.add),
                    label: const Text("Add Task"),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.addSkill(
                      Skill(title: skillNameController.text, tasks: tasks),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("Create Skill"),
                ),
                const SizedBox(
                  width: 16,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
