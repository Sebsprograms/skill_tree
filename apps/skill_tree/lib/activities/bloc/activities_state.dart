part of 'activities_bloc.dart';

enum ActivitiesStatus {
  initial,
  loading,
  loaded,
  error,
}

final class ActivitiesState extends Equatable {
  const ActivitiesState({
    this.status = ActivitiesStatus.initial,
    this.activities = const [],
  });

  final ActivitiesStatus status;
  final List<Activity> activities;

  ActivitiesState copyWith({
    ActivitiesStatus? status,
    List<Activity>? activities,
  }) {
    return ActivitiesState(
      activities: activities ?? this.activities,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        status,
        activities,
      ];
}
