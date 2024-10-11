import 'package:flutter/material.dart';
import 'package:skill_tree/home/cubit/home_cubit.dart';
import 'package:skill_tree/home/widgets/tab_button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Active', type: TabButton)
Widget activeTabButton(BuildContext context) {
  return const Center(
    child: TabButton(
      icon: Icon(Icons.abc),
      groupValue: HomeTab.activities,
      value: HomeTab.activities,
    ),
  );
}

@widgetbook.UseCase(name: 'Inactive', type: TabButton)
Widget inactiveTabButton(BuildContext context) {
  return const Center(
    child: TabButton(
      icon: Icon(Icons.abc),
      groupValue: HomeTab.settings,
      value: HomeTab.activities,
    ),
  );
}
