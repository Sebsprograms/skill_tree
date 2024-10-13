import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/view_skill/bloc/view_skill_bloc.dart';
import 'package:skill_tree/view_skill/view/view.dart';
import 'package:skills_repository/skills_repository.dart';

class ViewSkillPage extends StatelessWidget {
  const ViewSkillPage({
    super.key,
  });

  static Route<void> route({required String skillId}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => ViewSkillBloc(
          skillsRepository: context.read<SkillsRepository>(),
          skillId: skillId,
        )..add(InitializeData(skillId)),
        child: const ViewSkillPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const ViewSkillView();
  }
}

class ViewSkillView extends StatelessWidget {
  const ViewSkillView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewSkillBloc, ViewSkillState>(
      builder: (context, state) {
        switch (state.status) {
          case ViewSkillStatus.initial:
          case ViewSkillStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ViewSkillStatus.loaded:
            if (state.skill == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.isEditMode) {
              return const EditSkill();
            } else {
              return ViewSkill(
                skill: state.skill!,
              );
            }
          case ViewSkillStatus.error:
            return const Center(
              child: Text('Something went wrong.'),
            );
        }
      },
    );
  }
}
