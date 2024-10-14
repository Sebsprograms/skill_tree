import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/create_activity/bloc/create_activity_bloc.dart';

class CreateActivityCooldown extends StatelessWidget {
  const CreateActivityCooldown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateActivityBloc, CreateActivityState>(
      builder: (context, state) {
        return DurationPicker(
          duration: state.cooldown,
          onChange: (Duration duration) {
            context.read<CreateActivityBloc>().add(
                  CooldownChangedEvent(duration),
                );
          },
        );
      },
    );
  }
}
