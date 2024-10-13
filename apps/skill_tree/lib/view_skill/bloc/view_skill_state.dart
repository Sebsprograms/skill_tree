part of 'view_skill_bloc.dart';

enum ViewSkillStatus {
  initial,
  loading,
  loaded,
  error,
}

class ViewSkillState extends Equatable {
  const ViewSkillState({
    this.status = ViewSkillStatus.initial,
    this.skill,
    this.isEditMode = false,
  });

  final ViewSkillStatus status;
  final Skill? skill;
  final bool isEditMode;

  ViewSkillState copyWith({
    ViewSkillStatus? status,
    Skill? skill,
  }) {
    return ViewSkillState(
      status: status ?? this.status,
      skill: skill ?? this.skill,
    );
  }

  @override
  List<Object?> get props => [
        status,
        skill,
      ];
}
