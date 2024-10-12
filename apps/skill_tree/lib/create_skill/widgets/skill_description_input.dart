import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/create_skill/bloc/create_skill_bloc.dart';

class SkillDescriptionInput extends StatelessWidget {
  const SkillDescriptionInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateSkillBloc, CreateSkillState>(
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
            hintText: 'Description',
          ),
          onChanged: (value) {
            context.read<CreateSkillBloc>().add(DescriptionChanged(value));
          },
          maxLines: 4,
          maxLength: 200,
        );
      },
    );
  }
}
