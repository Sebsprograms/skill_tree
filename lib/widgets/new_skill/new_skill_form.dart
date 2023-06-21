import 'package:flutter/material.dart';
import 'package:skill_tree/models/skill.dart';
import 'package:skill_tree/widgets/new_skill/new_task.dart';

class NewSkillForm extends StatefulWidget {
  const NewSkillForm({super.key});

  @override
  State<NewSkillForm> createState() => _NewSkillFormState();
}

class _NewSkillFormState extends State<NewSkillForm> {
  final skillNameController = TextEditingController();
  final List<NewTask> tasks = [];
  @override
  void initState() {
    super.initState();
    tasks.add(NewTask(
      deleteTask: deleteTask,
      id: uuid.v4(),
    ));
  }

  addTask() {
    setState(() {
      tasks.add(NewTask(
        deleteTask: deleteTask,
        id: uuid.v4(),
      ));
      print(uuid.v4());
    });
  }

  deleteTask(String id) {
    setState(() {
      tasks.removeWhere((element) => element.id == id);
    });
  }

  @override
  void dispose() {
    skillNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
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
          Text("Tasks"),
          const SizedBox(
            height: 8,
          ),
          ...tasks,
          const SizedBox(
            height: 8,
          ),
          ElevatedButton.icon(
            onPressed: addTask,
            icon: const Icon(Icons.add),
            label: const Text("Add Task"),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
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
    );
  }
}
