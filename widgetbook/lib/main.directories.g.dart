// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/home/widgets/tab_button.dart' as _i2;
import 'package:widgetbook_workspace/skills/widgets/exp_bar.dart' as _i3;
import 'package:widgetbook_workspace/skills/widgets/level_indicator.dart'
    as _i4;
import 'package:widgetbook_workspace/skills/widgets/skill_list_tile.dart'
    as _i5;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'home',
    children: [
      _i1.WidgetbookFolder(
        name: 'widgets',
        children: [
          _i1.WidgetbookComponent(
            name: 'TabButton',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Active',
                builder: _i2.activeTabButton,
              ),
              _i1.WidgetbookUseCase(
                name: 'Inactive',
                builder: _i2.inactiveTabButton,
              ),
            ],
          )
        ],
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'skills',
    children: [
      _i1.WidgetbookFolder(
        name: 'widgets',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'ExpBar',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i3.activeExpBar,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'LevelIndicator',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i4.activeLevelIndicator,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'SkillListTile',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i5.activeSkillListTile,
            ),
          ),
        ],
      )
    ],
  ),
];
