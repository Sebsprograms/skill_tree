import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/skills/bloc/skills_bloc.dart';
import 'package:skill_tree/skills/view/skills_list.dart';
import 'package:skills_repository/skills_repository.dart';

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
              skills: state.skills,
            );
        }
      },
    );
  }
}
