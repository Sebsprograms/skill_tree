import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/l10n/l10n.dart';
import 'package:skill_tree/skills/bloc/skills_bloc.dart';
import 'package:skill_tree/skills/widgets/widgets.dart';
import 'package:skills_api/models/models.dart';
import 'package:skills_repository/skills_repository.dart';

List<Skill> dummyData = [
  Skill(
    title: 'Test Skill 1',
    colorCode: colorToHex(Colors.green),
    currentExp: 25,
    currentLevel: 2,
    requiredExpToNextLevel: 200,
    description:
        'A few sentences about what this skill represents to the user...',
    progressDifficulty: ProgressDifficulty.easy,
  ),
  Skill(
    title: 'Test Skill 2',
    colorCode: colorToHex(Colors.yellow),
    currentExp: 1025,
    currentLevel: 28,
    requiredExpToNextLevel: 2000,
    description:
        'A few sentences about what this skill represents to the user...',
    progressDifficulty: ProgressDifficulty.easy,
  ),
  Skill(
    title: 'Test Skill 3',
    colorCode: colorToHex(Colors.red),
    currentExp: 250,
    currentLevel: 4,
    requiredExpToNextLevel: 300,
    description:
        'A few sentences about what this skill represents to the user...',
    progressDifficulty: ProgressDifficulty.easy,
  ),
];

String colorToHex(Color color) {
  return '#${(color.value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
}

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SkillsBloc(
        skillsRepository: context.read<SkillsRepository>(),
      )..add(const SkillsSubscriptionRequested()),
      child: const SkillsView(),
    );
  }
}

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillsBloc, SkillsState>(
      builder: (context, state) {
        switch (state.status) {
          case SkillsStatus.initial:
          case SkillsStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case SkillsStatus.error:
            return const Center(
              child: Text('Something went wrong'),
            );
          case SkillsStatus.loaded:
            return SkillsList(
              skills: [
                ...dummyData,
                ...dummyData,
                ...dummyData,
                ...dummyData,
                ...dummyData,
                ...dummyData,
                ...dummyData,
              ],
            );
        }
      },
    );
  }
}

class SkillsList extends StatelessWidget {
  const SkillsList({required this.skills, super.key});

  final List<Skill> skills;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.skillsAppBarTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: ListView.builder(
        itemCount: skills.length,
        itemBuilder: (context, index) => SkillListTile(
          skill: skills[index],
        ),
      ),
    );
  }
}
