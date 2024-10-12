part of 'create_skill_bloc.dart';

final class CreateSkillState {
  CreateSkillState({
    required this.title,
    required this.description,
    required this.color,
    required this.isValid,
  });

  final String title;
  final String description;
  final Color color;
  final bool isValid;

  CreateSkillState copyWith({
    String? title,
    String? description,
    Color? color,
    bool? isValid,
  }) {
    return CreateSkillState(
      title: title ?? this.title,
      description: description ?? this.description,
      color: color ?? this.color,
      isValid: isValid ?? this.isValid,
    );
  }
}
