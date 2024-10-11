part of 'skills_bloc.dart';

sealed class SkillsEvent extends Equatable {
  const SkillsEvent();

  @override
  List<Object> get props => [];
}

final class SkillsSubscriptionRequested extends SkillsEvent {
  const SkillsSubscriptionRequested();
}
