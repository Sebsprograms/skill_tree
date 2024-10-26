import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:skill_tree/create_activity/bloc/create_activity_bloc.dart';
import 'package:skill_tree/utils/color_helpers.dart';

class CreateActivityLinkedSkills extends StatelessWidget {
  const CreateActivityLinkedSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateActivityBloc, CreateActivityState>(
      builder: (context, state) {
        return Column(
          children: state.linkableSkills.map((linkableSkill) {
            final skill = linkableSkill.skill;
            final backgroundColor = hexToColor(skill.colorCode);
            final foregroundColor = getContrastingTextColor(backgroundColor);
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: backgroundColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      checkColor: foregroundColor,
                      activeColor: backgroundColor,
                      value: linkableSkill.isSelected,
                      onChanged: (checked) {
                        if (checked == null) return;
                        context.read<CreateActivityBloc>().add(
                              UpdateLinkedSkillState(
                                linkableSkill.copyWith(isSelected: checked),
                              ),
                            );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      skill.title,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  InputQty.int(
                    decoration: QtyDecorationProps(
                      btnColor: Theme.of(context).colorScheme.primary,
                      isBordered: false,
                    ),
                    maxVal: 250,
                    initVal: linkableSkill.linkedSkilldata.xpReward,
                    minVal: 5,
                    steps: 5,
                    onQtyChanged: (val) {
                      context.read<CreateActivityBloc>().add(
                            UpdateLinkedSkillState(
                              linkableSkill.copyWith(xp: val as int),
                            ),
                          );
                    },
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
