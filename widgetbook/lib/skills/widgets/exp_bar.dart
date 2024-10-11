import 'package:flutter/material.dart';
import 'package:skill_tree/skills/widgets/exp_bar.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/dummyData/dummy_data.dart';

@widgetbook.UseCase(name: 'Default', type: ExpBar)
Widget activeExpBar(BuildContext context) {
  return Center(
    child: ExpBar(
      currentExp: dummySkill.currentExp,
      expRequiredToLevelUp: dummySkill.requiredExpToNextLevel,
    ),
  );
}
