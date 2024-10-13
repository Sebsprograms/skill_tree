import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/create_skill/bloc/create_skill_bloc.dart';
import 'package:skill_tree/create_skill/widgets/widgets.dart';
import 'package:skills_api/models/models.dart';
import 'package:skills_repository/skills_repository.dart';

class CreateSkillPage extends StatelessWidget {
  const CreateSkillPage({this.initialSkill, super.key});

  final Skill? initialSkill;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateSkillBloc(
        skillsRepository: context.read<SkillsRepository>(),
        initialSkill: initialSkill,
      ),
      child: CreateSkillView(
        initialSkill: initialSkill,
      ),
    );
  }
}

class CreateSkillView extends StatelessWidget {
  const CreateSkillView({this.initialSkill, super.key});
  final Skill? initialSkill;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        child: Column(
          children: [
            Text(
              initialSkill == null ? 'Create Skill' : 'Edit Skill',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 16,
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SkillTitleInput(),
                    SkillDescriptionInput(),
                    SizedBox(
                      width: 4,
                    ),
                    Text('Difficulty'),
                    SkillDifficultySlider(),
                    SizedBox(
                      width: 4,
                    ),
                    Text('Skill color'),
                    SizedBox(
                      width: 2,
                    ),
                    SkillColorPicker(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  BlocBuilder<CreateSkillBloc, CreateSkillState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state.isValid
                            ? () async {
                                context
                                    .read<CreateSkillBloc>()
                                    .add(FormSubmitted());

                                Navigator.pop(context);
                              }
                            : null,
                        child: const Text('Submit'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
