import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:skill_tree/create_skill/bloc/create_skill_bloc.dart';

class SkillColorPicker extends StatelessWidget {
  const SkillColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateSkillBloc, CreateSkillState>(
      builder: (context, state) {
        return ColorPicker(
          pickerColor: state.color,
          enableAlpha: false,
          onColorChanged: (color) {
            context.read<CreateSkillBloc>().add(ColorChanged(color));
          },
        );
      },
    );
  }
}
