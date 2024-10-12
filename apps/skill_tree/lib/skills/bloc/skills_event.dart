part of 'skills_bloc.dart';

sealed class SkillsEvent extends Equatable {
  const SkillsEvent();

  @override
  List<Object?> get props => [];
}

final class SkillsSubscriptionRequested extends SkillsEvent {
  const SkillsSubscriptionRequested();
}

final class SkillsSubmittedNewSkill extends SkillsEvent {
  const SkillsSubmittedNewSkill({
    required this.title,
    required this.colorHex,
    required this.difficulty,
    this.description,
  });

  final String title;
  final String? description;
  final String colorHex;
  final ProgressDifficulty difficulty;

  @override
  List<Object?> get props => [
        title,
        description,
        colorHex,
        difficulty,
      ];
}
