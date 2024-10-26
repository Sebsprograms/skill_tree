import 'package:activities_api/activities_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/activities/bloc/activities_bloc.dart';
import 'package:skill_tree/utils/color_helpers.dart';

class LinkedSkill extends StatelessWidget {
  const LinkedSkill({
    required this.linkedSkill,
    super.key,
  });

  final ActivityLinkedSkill linkedSkill;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivitiesBloc, ActivitiesState>(
      builder: (context, state) {
        final skill = state.getSkillById(linkedSkill.skillId);
        final color = hexToColor(skill.colorCode);
        final textColor = getContrastingTextColor(color);
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: color,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                skill.title,
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                '${linkedSkill.xpReward}xp',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
