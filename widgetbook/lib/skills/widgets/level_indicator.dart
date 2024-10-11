import 'package:flutter/material.dart';
import 'package:skill_tree/skills/widgets/level_indicator.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/dummyData/dummy_data.dart';

@widgetbook.UseCase(name: 'Default', type: LevelIndicator)
Widget activeLevelIndicator(BuildContext context) {
  return Center(
    child: LevelIndicator(
      level: dummySkill.currentLevel,
      backgroundColorHex: dummySkill.colorCode,
    ),
  );
}
