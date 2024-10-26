import 'dart:async';

import 'package:activities_api/activities_api.dart';
import 'package:activities_repository/activities_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:skills_api/models/models.dart';
import 'package:skills_repository/skills_repository.dart';

part 'activities_event.dart';
part 'activities_state.dart';

class ActivitiesBloc extends Bloc<ActivitiesEvent, ActivitiesState> {
  ActivitiesBloc({
    required ActivitiesRepository activitiesRepository,
    required SkillsRepository skillsRepository,
  })  : _activitiesRepository = activitiesRepository,
        _skillsRepository = skillsRepository,
        super(const ActivitiesState()) {
    on<ActivitiesSubscriptionRequested>(_activitiesSubscriptionRequested);
    on<SkillsSubscriptionRequested>(_skillsSubscriptionRequested);
  }

  final ActivitiesRepository _activitiesRepository;
  final SkillsRepository _skillsRepository;

  FutureOr<void> _activitiesSubscriptionRequested(
    ActivitiesSubscriptionRequested event,
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

  FutureOr<void> _skillsSubscriptionRequested(
      SkillsSubscriptionRequested event, Emitter<ActivitiesState> emit) async {
    emit(state.copyWith(status: ActivitiesStatus.loading));

    await emit.forEach(
      _skillsRepository.getSkills(),
      onData: (data) => state.copyWith(
        status: ActivitiesStatus.loaded,
        skills: data,
      ),
      onError: (error, stackTrace) => state.copyWith(
        status: ActivitiesStatus.error,
      ),
    );
  }
}
