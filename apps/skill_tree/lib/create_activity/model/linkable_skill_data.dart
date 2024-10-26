import 'package:activities_api/activities_api.dart';
import 'package:equatable/equatable.dart';
import 'package:skills_api/models/skill.dart';

class LinkableSkillState extends Equatable {
  const LinkableSkillState({
    required this.linkedSkilldata,
    required this.isSelected,
    required this.skillId,
    required this.skill,
  });

  final ActivityLinkedSkill linkedSkilldata;
  final bool isSelected;
  final String skillId;
  final Skill skill;

  LinkableSkillState copyWith({
    bool? isSelected,
    int? xp,
  }) {
    return LinkableSkillState(
      isSelected: isSelected ?? this.isSelected,
      skillId: skillId,
      skill: skill,
      linkedSkilldata: ActivityLinkedSkill(
        skillId: skillId,
        xpReward: xp ?? linkedSkilldata.xpReward,
      ),
    );
  }

  @override
  List<Object> get props => [
        linkedSkilldata,
        isSelected,
        skill,
        skillId,
      ];
}
