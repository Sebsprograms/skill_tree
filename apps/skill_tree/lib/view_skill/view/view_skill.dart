import 'package:flutter/material.dart';
import 'package:skill_tree/skills/widgets/exp_bar.dart';
import 'package:skill_tree/skills/widgets/level_indicator.dart';
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
            ],
          ),
        ));
  }
}
