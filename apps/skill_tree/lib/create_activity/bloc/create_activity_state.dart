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
    this.title = '',
    this.cooldown = const Duration(minutes: 15),
    this.linkableSkills = const [],
    this.isValid = false,
  });

  final CreateActivityStatus status;
  final List<LinkableSkillState> linkableSkills;
  final String title;
  final Duration cooldown;
  final bool isValid;

  CreateActivityState copyWith({
    CreateActivityStatus? status,
    String? title,
    Duration? cooldown,
    List<LinkableSkillState>? linkableSkills,
    bool? isValid,
  }) {
    return CreateActivityState(
      status: status ?? this.status,
      title: title ?? this.title,
      cooldown: cooldown ?? this.cooldown,
      linkableSkills: linkableSkills ?? this.linkableSkills,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [
        isValid,
        status,
        cooldown,
        linkableSkills,
        title,
      ];
}
