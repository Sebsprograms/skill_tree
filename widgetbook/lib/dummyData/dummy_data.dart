import 'package:flutter/material.dart';
import 'package:skills_api/models/models.dart';

String colorToHex(Color color) {
  return '#${(color.value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
}

final dummySkill = Skill(
  title: 'Test Skill 1',
  colorCode: colorToHex(Colors.green),
  currentExp: 25,
  currentLevel: 2,
  requiredExpToNextLevel: 200,
  description:
      'A few sentences about what this skill represents to the user...',
  progressDifficulty: ProgressDifficulty.easy,
);
