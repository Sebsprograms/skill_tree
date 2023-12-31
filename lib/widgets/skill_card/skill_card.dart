import 'package:flutter/material.dart';
import 'package:skill_tree/models/skill.dart';
import 'package:skill_tree/models/task.dart';
import 'package:skill_tree/widgets/skill_card/exp_bar.dart';
import 'package:skill_tree/widgets/skill_card/skill_detail_view.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    required this.skill,
    required this.increaseExp,
    required this.deleteSkill,
    required this.addTask,
    required this.addSkill,
    required this.deleteTask,
    super.key,
  });

  final Skill skill;
  final void Function(String skillId, String taskId) increaseExp;
  final void Function(String skillId, Task task) addTask;
  final void Function(Skill skill) addSkill;
  final void Function(String skillId, String taskId) deleteTask;
  final void Function(String skillId) deleteSkill;

  void increaseExpOnSkill(String taskId) {
    increaseExp(skill.id, taskId);
  }

  void openSkillDetailView() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => StatefulBuilder(
            builder: (context, setter) => SkillDetailView(
              skill: skill,
              setter: setter,
              increaseExp: increaseExpOnSkill,
              addSkill: addSkill,
              deleteSkill: deleteSkill,
              addTask: addTask,
              deleteTask: deleteTask,
            ),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Text(skill.title),
                  const Spacer(),
                  Text("Level: ${skill.level}"),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text("Current Exp: ${skill.currentExp}"),
                  const Spacer(),
                  Text("Next Level Exp: ${skill.expToNextLvl}"),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ExpBar(fill: skill.currentExp / skill.expToNextLvl),
            ],
          ),
        ),
      ),
    );
  }
}
