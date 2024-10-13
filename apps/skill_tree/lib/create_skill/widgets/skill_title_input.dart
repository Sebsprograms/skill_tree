import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/create_skill/bloc/create_skill_bloc.dart';

class SkillTitleInput extends StatelessWidget {
  const SkillTitleInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateSkillBloc, CreateSkillState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.title,
          decoration: InputDecoration(
            hintText: 'Title',
            errorText: (state.title.isEmpty || state.title.length < 3)
                ? 'Title must be over 3 characters'
                : null,
          ),
          style: const TextStyle(
            fontSize: 24,
          ),
          onChanged: (value) {
            context.read<CreateSkillBloc>().add(TitleChanged(value));
          },
          maxLength: 20,
        );
      },
    );
  }
}
