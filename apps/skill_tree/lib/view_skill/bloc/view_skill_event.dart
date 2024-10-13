part of 'view_skill_bloc.dart';

@immutable
sealed class ViewSkillEvent extends Equatable {}

final class InitializeData extends ViewSkillEvent {
  InitializeData(this.skillId);

  final String skillId;

  @override
  List<Object> get props => [
        skillId,
      ];
}

final class SwitchEditMode extends ViewSkillEvent {
  SwitchEditMode({required this.isEditMode});

  final bool isEditMode;

  @override
  List<Object> get props => [
        isEditMode,
      ];
}

final class UpdateSkill extends ViewSkillEvent {
  UpdateSkill(this.updatedSkill);

  final Skill updatedSkill;

  @override
  List<Object> get props => [
        updatedSkill,
      ];
}
