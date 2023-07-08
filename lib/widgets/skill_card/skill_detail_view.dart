import 'package:flutter/material.dart';
import 'package:skill_tree/models/skill.dart';
import 'package:skill_tree/models/task.dart';
import 'package:skill_tree/widgets/skill_card/skill_specs.dart';
import 'package:skill_tree/widgets/skill_card/task/new_task_dialog.dart';
import 'package:skill_tree/widgets/skill_card/task/task_item.dart';

class SkillDetailView extends StatelessWidget {
  const SkillDetailView({
    super.key,
    required this.skill,
    required this.increaseExp,
    required this.deleteSkill,
    required this.addTask,
    required this.addSkill,
    required this.deleteTask,
    required this.setter,
  });

  final Skill skill;
  final void Function(String taskId) increaseExp;
  final void Function(Skill skill) addSkill;
  final void Function(String skillId) deleteSkill;
  final void Function(String skillId, Task task) addTask;
  final void Function(String skillId, String taskId) deleteTask;
  final void Function(void Function()) setter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SkillSpecs(
            skill: skill,
            addSkill: addSkill,
            deleteSkill: deleteSkill,
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
