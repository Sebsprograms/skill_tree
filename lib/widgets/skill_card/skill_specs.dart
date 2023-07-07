import 'package:flutter/material.dart';
import 'package:skill_tree/models/skill.dart';
import 'package:skill_tree/widgets/skill_card/exp_bar.dart';
import 'package:skill_tree/widgets/skill_card/skill_detail_title.dart';

class SkillSpecs extends StatelessWidget {
  const SkillSpecs({
    super.key,
    required this.skill,
    required this.deleteSkill,
  });
  final Skill skill;
  final void Function(String skillId) deleteSkill;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 16,
        top: 64,
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
      ),
      child: Column(children: [
        SkillDetailTitle(skill: skill, deleteSkill: deleteSkill),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Level: ${skill.level}",
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        ExpBar(fill: skill.currentExp / skill.expToNextLvl),
        const SizedBox(
          height: 6,
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              child: Text(
                '${skill.currentExp}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              child: Text(
                '${skill.expToNextLvl}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
