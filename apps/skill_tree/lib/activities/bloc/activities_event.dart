part of 'activities_bloc.dart';

@immutable
sealed class ActivitiesEvent {}

final class ActivitiesSubscriptionRequested extends ActivitiesEvent {}

final class SkillsSubscriptionRequested extends ActivitiesEvent {}
