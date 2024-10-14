part of 'create_activity_bloc.dart';

enum CreateActivityStatus {
  initial,
  loading,
  loaded,
  error,
}

final class CreateActivityState extends Equatable {
  const CreateActivityState({
    this.status = CreateActivityStatus.initial,
    this.skills = const [],
    this.title = '',
    this.cooldown = const Duration(minutes: 15),
    this.activityLinkedSkills = const [],
    this.isValid = false,
  });

  final CreateActivityStatus status;
  final List<Skill> skills;

  // Form data
  final String title;
  final Duration cooldown;
  final List<ActivityLinkedSkill> activityLinkedSkills;

  // Validation
  final bool isValid;

  CreateActivityState copyWith({
    CreateActivityStatus? status,
    List<Skill>? skills,
    String? title,
    Duration? cooldown,
    List<ActivityLinkedSkill>? activityLinkedSkills,
    bool? isValid,
  }) {
    return CreateActivityState(
      skills: skills ?? this.skills,
      status: status ?? this.status,
      title: title ?? this.title,
      cooldown: cooldown ?? this.cooldown,
      activityLinkedSkills: activityLinkedSkills ?? this.activityLinkedSkills,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [
        skills,
        status,
        cooldown,
        activityLinkedSkills,
        title,
      ];
}
