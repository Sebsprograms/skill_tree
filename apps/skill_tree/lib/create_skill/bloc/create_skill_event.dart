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

class ColorChanged extends CreateSkillEvent {
  ColorChanged(this.color);
  final Color color;
}
