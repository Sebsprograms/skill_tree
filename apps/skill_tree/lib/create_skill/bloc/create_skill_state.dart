part of 'create_skill_bloc.dart';

final class CreateSkillState extends Equatable {
  const CreateSkillState({
    required this.id,
    required this.title,
    required this.description,
    required this.color,
    required this.isValid,
    required this.progressDifficulty,
  });

  final String? id;
  final String title;
  final String description;
  final Color color;
  final bool isValid;
  final ProgressDifficulty progressDifficulty;

  CreateSkillState copyWith({
    String? id,
    String? title,
    String? description,
    Color? color,
    bool? isValid,
    ProgressDifficulty? progressDifficulty,
  }) {
    return CreateSkillState(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      color: color ?? this.color,
      progressDifficulty: progressDifficulty ?? this.progressDifficulty,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        color,
        progressDifficulty,
        isValid,
      ];
}
