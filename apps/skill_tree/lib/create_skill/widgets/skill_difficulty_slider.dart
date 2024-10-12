import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/create_skill/bloc/create_skill_bloc.dart';
import 'package:skill_tree/utils/color_helpers.dart';
import 'package:skills_api/models/progress_difficulty.dart';

class SkillDifficultySlider extends StatelessWidget {
  const SkillDifficultySlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateSkillBloc, CreateSkillState>(
      builder: (context, state) {
        final progressDifficulty = state.progressDifficulty;
        final color = hexToColor(progressDifficulty.colorCode);
        final textColor = getContrastingTextColor(color);
        return SliderTheme(
          data: SliderThemeData(
            activeTrackColor: color,
            inactiveTrackColor: color.withOpacity(0.3),
            thumbColor: color,
            overlayColor: color.withOpacity(0.2),
            valueIndicatorColor: color,
            valueIndicatorTextStyle: TextStyle(
              color: textColor,
            ),
          ),
          child: Slider(
            value: progressDifficulty.index.toDouble(),
            max: ProgressDifficulty.values.length - 1,
            divisions: ProgressDifficulty.values.length - 1,
            label: ' ${progressDifficulty.label} ',
            onChanged: (value) {
              final selectedDifficulty =
                  ProgressDifficulty.values[value.toInt()];
              context.read<CreateSkillBloc>().add(
                    ProgressDifficultyChanged(
                      selectedDifficulty,
                    ),
                  );
            },
          ),
        );
      },
    );
  }
}
