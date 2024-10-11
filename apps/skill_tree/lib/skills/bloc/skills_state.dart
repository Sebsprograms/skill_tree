part of 'skills_bloc.dart';

enum SkillsStatus {
  initial,
  loading,
  loaded,
  error,
}

final class SkillsState extends Equatable {
  const SkillsState({
    this.status = SkillsStatus.initial,
    this.skills = const [],
  });

  final SkillsStatus status;
  final List<Skill> skills;

  SkillsState copyWith({
    SkillsStatus? status,
    List<Skill>? skills,
  }) {
    return SkillsState(
      status: status ?? this.status,
      skills: skills ?? this.skills,
    );
  }

  @override
  List<Object?> get props => [
        status,
        skills,
      ];
}
