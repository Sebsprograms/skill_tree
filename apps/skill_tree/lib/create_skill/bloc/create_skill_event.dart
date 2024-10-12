part of 'create_skill_bloc.dart';

@immutable
sealed class CreateSkillEvent {}

class TitleChanged extends CreateSkillEvent {
  TitleChanged(this.title);
  final String title;
}

class DescriptionChanged extends CreateSkillEvent {
  DescriptionChanged(this.description);
  final String description;
}

class ProgressDifficultyChanged extends CreateSkillEvent {
  ProgressDifficultyChanged(this.difficulty);
  final ProgressDifficulty difficulty;
}

class ColorChanged extends CreateSkillEvent {
  ColorChanged(this.color);
  final Color color;
}

final class FormSubmitted extends CreateSkillEvent {}
