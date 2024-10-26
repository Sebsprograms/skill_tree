part of 'activities_bloc.dart';

enum ActivitiesStatus {
  initial,
  loading,
  loaded,
  error,
}

enum Mode {
  edit,
  score,
}

final class ActivitiesState extends Equatable {
  const ActivitiesState({
    this.status = ActivitiesStatus.initial,
    this.activities = const [],
    this.skills = const [],
    this.mode = Mode.score,
  });

  final ActivitiesStatus status;
  final List<Activity> activities;
  final List<Skill> skills;
  final Mode mode;

  Skill getSkillById(String skillId) {
    return skills.firstWhere(
      (skill) => skill.id == skillId,
    );
  }

  ActivitiesState copyWith({
    ActivitiesStatus? status,
    List<Activity>? activities,
    List<Skill>? skills,
    Mode? mode,
  }) {
    return ActivitiesState(
      activities: activities ?? this.activities,
      skills: skills ?? this.skills,
      status: status ?? this.status,
      mode: mode ?? this.mode,
    );
  }

  @override
  List<Object> get props => [
        status,
        skills,
        activities,
        mode,
      ];
}
