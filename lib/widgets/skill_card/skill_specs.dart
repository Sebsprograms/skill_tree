import 'package:flutter/material.dart';
import 'package:skill_tree/models/skill.dart';
import 'package:skill_tree/widgets/skill_card/exp_bar.dart';

class SkillSpecs extends StatelessWidget {
  const SkillSpecs({
    super.key,
    required this.skill,
  });
  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          width: double.infinity,
          child: Center(
            child: Text(
              "Level: ${skill.level}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
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
                color: Theme.of(context).colorScheme.primaryContainer,
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
                color: Theme.of(context).colorScheme.primaryContainer,
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
