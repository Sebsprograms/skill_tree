import 'package:flutter/material.dart';
import 'package:skill_tree/skills/widgets/widgets.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/dummyData/dummy_data.dart';

@widgetbook.UseCase(name: 'Default', type: SkillListTile)
Widget activeSkillListTile(BuildContext context) {
  return Center(
    child: ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) => SkillListTile(skill: dummySkill),
    ),
  );
}
