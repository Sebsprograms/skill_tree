import 'dart:async';

import 'package:activities_api/activities_api.dart';
import 'package:activities_repository/activities_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'activities_event.dart';
part 'activities_state.dart';

class ActivitiesBloc extends Bloc<ActivitiesEvent, ActivitiesState> {
  ActivitiesBloc({
    required ActivitiesRepository activitiesRepository,
  })  : _activitiesRepository = activitiesRepository,
        super(const ActivitiesState()) {
    on<ActivitiesSubsctiptionRequested>(_activitiesSubscriptionRequested);
  }

  final ActivitiesRepository _activitiesRepository;

  FutureOr<void> _activitiesSubscriptionRequested(
    ActivitiesSubsctiptionRequested event,
    Emitter<ActivitiesState> emit,
  ) async {
    emit(state.copyWith(status: ActivitiesStatus.loading));

    await emit.forEach(
      _activitiesRepository.getActivities(),
      onData: (data) => state.copyWith(
        status: ActivitiesStatus.loaded,
        activities: data,
      ),
      onError: (error, stackTrace) => state.copyWith(
        status: ActivitiesStatus.error,
      ),
    );
  }
}
