import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:skill_tree/create_skill/bloc/create_skill_bloc.dart';
import 'package:skills_repository/skills_repository.dart';

class CreateSkillPage extends StatelessWidget {
  const CreateSkillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateSkillBloc(
        skillsRepository: context.read<SkillsRepository>(),
      ),
      child: const CreateSkillView(),
    );
  }
}

class CreateSkillView extends StatelessWidget {
  const CreateSkillView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BlocBuilder<CreateSkillBloc, CreateSkillState>(
                      builder: (context, state) {
                        return TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Title',
                            errorText:
                                (state.title.isEmpty || state.title.length < 3)
                                    ? 'Title must be over 3 characters'
                                    : null,
                          ),
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                          onChanged: (value) {
                            context
                                .read<CreateSkillBloc>()
                                .add(TitleChanged(value));
                          },
                          maxLength: 20,
                        );
                      },
                    ),
                    BlocBuilder<CreateSkillBloc, CreateSkillState>(
                      builder: (context, state) {
                        return TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Description',
                          ),
                          onChanged: (value) {
                            context
                                .read<CreateSkillBloc>()
                                .add(DescriptionChanged(value));
                          },
                          maxLines: 4,
                          maxLength: 200,
                        );
                      },
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text('Skill color'),
                    const SizedBox(
                      width: 2,
                    ),
                    BlocBuilder<CreateSkillBloc, CreateSkillState>(
                      builder: (context, state) {
                        return ColorPicker(
                          pickerColor: state.color,
                          onColorChanged: (color) {
                            context
                                .read<CreateSkillBloc>()
                                .add(ColorChanged(color));
                          },
                        );
                      },
                    ),
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
