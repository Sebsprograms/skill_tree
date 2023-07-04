import 'package:flutter/material.dart';
import 'package:skill_tree/models/skill.dart';
import 'package:skill_tree/models/task.dart';
import 'package:skill_tree/widgets/skill_card/exp_bar.dart';
import 'package:skill_tree/widgets/skill_card/task/new_task_dialog.dart';
import 'package:skill_tree/widgets/skill_card/task/task_item.dart';

class SkillDetailView extends StatelessWidget {
  const SkillDetailView({
    super.key,
    required this.skill,
    required this.increaseExp,
    required this.deleteSkill,
    required this.addTask,
    required this.deleteTask,
    required this.setter,
  });

  final Skill skill;
  final void Function(String taskId) increaseExp;
  final void Function(String skillId) deleteSkill;
  final void Function(String skillId, Task task) addTask;
  final void Function(String skillId, String taskId) deleteTask;
  final void Function(void Function()) setter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 64,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        content: Text(
                            "Are you sure you want to delete ${skill.title}?"),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              deleteSkill(skill.id);
                              Navigator.of(context).pop();
                              Navigator.pop(ctx);
                            },
                            child: const Text("Delete"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                            child: const Text("Cancel"),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete),
                ),
                Text(skill.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.clear),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      "Level: ${skill.level}",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                ExpBar(fill: skill.currentExp / skill.expToNextLvl),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text("Current Exp: ${skill.currentExp}"),
                    const Spacer(),
                    Text("Next Level Exp: ${skill.expToNextLvl}"),
                  ],
                ),
              ]),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  ...skill.tasks
                      .map((task) => TaskItem(
                            task: task,
                            increaseExp: increaseExp,
                            setter: setter,
                            deleteTask: deleteTask,
                            skillId: skill.id,
                          ))
                      .toList(),
                  ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => Dialog(
                                child: NewTaskDialog(
                                  skillId: skill.id,
                                  setter: setter,
                                  addTask: addTask,
                                ),
                              ));
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Add Task"),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
