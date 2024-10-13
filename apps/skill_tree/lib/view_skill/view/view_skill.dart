import 'package:flutter/material.dart';
import 'package:skill_tree/create_skill/view/create_skill_page.dart';
import 'package:skill_tree/skills/widgets/exp_bar.dart';
import 'package:skill_tree/skills/widgets/level_indicator.dart';
import 'package:skill_tree/view_skill/widgets/difficulty_indicator.dart';
import 'package:skills_api/models/models.dart';

class ViewSkill extends StatelessWidget {
  const ViewSkill({required this.skill, super.key});

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          skill.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CreateSkillPage(
                      initialSkill: skill,
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LevelIndicator(
                  level: skill.currentLevel,
                  backgroundColorHex: skill.colorCode,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ExpBar(
                      currentExp: skill.currentExp,
                      expRequiredToLevelUp: skill.requiredExpToNextLevel,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(skill.description.isEmpty ? '' : 'Description:'),
                DifficultyIndicator(
                  colorHex: skill.progressDifficulty.colorCode,
                  difficultyText:
                      'Difficulty - ${skill.progressDifficulty.label}',
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(skill.description),
          ],
        ),
      ),
    );
  }
}
