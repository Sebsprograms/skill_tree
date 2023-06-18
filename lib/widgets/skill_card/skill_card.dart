import 'package:flutter/material.dart';
import 'package:skill_tree/models/skill.dart';
import 'package:skill_tree/widgets/skill_card/task/task_item.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({required this.skill, required this.increaseExp, super.key});

  final Skill skill;
  final void Function(String skillId, String taskId) increaseExp;

  void increaseExpOnSkill(String taskId) {
    increaseExp(skill.id, taskId);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...skill.tasks
                    .map((task) => TaskItem(
                          task: task,
                          increaseExp: increaseExpOnSkill,
                        ))
                    .toList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
