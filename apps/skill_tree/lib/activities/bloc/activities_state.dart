part of 'activities_bloc.dart';

enum ActivitiesStatus {
  initial,
  loading,
  loaded,
  error,
}

final class ActivitiesState extends Equatable {
  const ActivitiesState({
    this.status = ActivitiesStatus.initial,
    this.activities = const [],
    this.skills = const [],
  });

  final ActivitiesStatus status;
  final List<Activity> activities;
  final List<Skill> skills;

  Skill getSkillById(String skillId) {
    return skills.firstWhere(
      (skill) => skill.id == skillId,
    );
  }

  ActivitiesState copyWith({
    ActivitiesStatus? status,
    List<Activity>? activities,
    List<Skill>? skills,
  }) {
    return ActivitiesState(
      activities: activities ?? this.activities,
      skills: skills ?? this.skills,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        status,
        skills,
        activities,
      ];
}
