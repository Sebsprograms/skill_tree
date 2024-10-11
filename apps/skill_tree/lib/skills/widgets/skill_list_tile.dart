import 'package:flutter/material.dart';
import 'package:skill_tree/skills/widgets/exp_bar.dart';
import 'package:skill_tree/skills/widgets/level_indicator.dart';
import 'package:skills_api/models/skill.dart';

class SkillListTile extends StatelessWidget {
  const SkillListTile({
    required this.skill,
    super.key,
  });

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // Navigate to Skill Details
      },
      leading: LevelIndicator(
        level: skill.currentLevel,
        backgroundColorHex: skill.colorCode,
      ),
      title: Container(
        padding: const EdgeInsets.only(
          bottom: 4,
        ),
        child: Center(
          child: Text(
            skill.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
      subtitle: ExpBar(
        currentExp: skill.currentExp,
        expRequiredToLevelUp: skill.requiredExpToNextLevel,
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 32),
    );
  }
}
