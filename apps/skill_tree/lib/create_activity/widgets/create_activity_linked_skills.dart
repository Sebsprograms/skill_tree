import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/create_activity/bloc/create_activity_bloc.dart';

class CreateActivityLinkedSkills extends StatelessWidget {
  const CreateActivityLinkedSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateActivityBloc, CreateActivityState>(
      builder: (context, state) {
        return Placeholder();
      },
    );
  }
}
