import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/create_activity/bloc/create_activity_bloc.dart';

class CreateActivityTitle extends StatelessWidget {
  const CreateActivityTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateActivityBloc, CreateActivityState>(
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
            context.read<CreateActivityBloc>().add(TitleChangedEvent(value));
          },
          maxLength: 20,
        );
      },
    );
  }
}
