part of 'create_activity_bloc.dart';

@immutable
sealed class CreateActivityEvent extends Equatable {}

final class SkillsSubscriptionRequested extends CreateActivityEvent {
  @override
  List<Object> get props => [];
}

final class TitleChangedEvent extends CreateActivityEvent {
  TitleChangedEvent(this.title);

  final String title;

  @override
  List<Object> get props => [
        title,
      ];
}

final class CooldownChangedEvent extends CreateActivityEvent {
  CooldownChangedEvent(this.cooldown);

  final Duration cooldown;

  @override
  List<Object> get props => [
        cooldown,
      ];
}

final class UpdateLinkedSkillState extends CreateActivityEvent {
  UpdateLinkedSkillState(this.linkableSkillState);

  final LinkableSkillState linkableSkillState;

  @override
  List<Object> get props => [
        linkableSkillState,
      ];
}

final class ActivityFormSubmittedEvent extends CreateActivityEvent {
  @override
  List<Object> get props => [];
}
