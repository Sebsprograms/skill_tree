import 'dart:async';

import 'package:activities_api/activities_api.dart';
import 'package:activities_repository/activities_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:skills_api/models/skill.dart';
import 'package:skills_repository/skills_repository.dart';

part 'create_activity_event.dart';
part 'create_activity_state.dart';

class CreateActivityBloc
    extends Bloc<CreateActivityEvent, CreateActivityState> {
  CreateActivityBloc({
    required ActivitiesRepository activitiesRepository,
    required SkillsRepository skillsRepository,
    Activity? initialActivity,
  })  : _activitiesRepository = activitiesRepository,
        _skillsRepository = skillsRepository,
        _initialActivity = initialActivity,
        super(
          CreateActivityState(
            title: initialActivity?.title ?? '',
            cooldown: initialActivity?.cooldown ?? const Duration(minutes: 15),
            activityLinkedSkills: initialActivity?.linkedSkills ?? const [],
            isValid: initialActivity != null,
          ),
        ) {
    on<SkillsSubscriptionRequested>(_skillsSubscriptionRequested);
    on<TitleChangedEvent>(_titleChanged);
    on<CooldownChangedEvent>(_cooldownChanged);
    on<LinkedSkillsChangedEvent>(_linkedSkillsChanged);
    on<ActivityFormSubmittedEvent>(_formSubmitted);
  }

  final SkillsRepository _skillsRepository;
  final ActivitiesRepository _activitiesRepository;

  final Activity? _initialActivity;

  FutureOr<void> _skillsSubscriptionRequested(
    SkillsSubscriptionRequested event,
    Emitter<CreateActivityState> emit,
  ) async {
    emit(state.copyWith(status: CreateActivityStatus.loading));

    await emit.forEach(
      _skillsRepository.getSkills(),
      onData: (data) => state.copyWith(
        skills: data,
        status: CreateActivityStatus.loaded,
      ),
      onError: (error, stackTrace) => state.copyWith(
        status: CreateActivityStatus.error,
      ),
    );
  }

  bool _validateForm(
    String title,
    List<ActivityLinkedSkill> activityLinkedSkills,
  ) {
    return title.isNotEmpty &&
        title.length >= 3 &&
        activityLinkedSkills.isNotEmpty;
  }

  FutureOr<void> _titleChanged(
    TitleChangedEvent event,
    Emitter<CreateActivityState> emit,
  ) {
    emit(
      state.copyWith(
        title: event.title,
        isValid: _validateForm(
          event.title,
          state.activityLinkedSkills,
        ),
      ),
    );
  }

  FutureOr<void> _cooldownChanged(
    CooldownChangedEvent event,
    Emitter<CreateActivityState> emit,
  ) {
    emit(
      state.copyWith(
        cooldown: event.cooldown,
        isValid: _validateForm(
          state.title,
          state.activityLinkedSkills,
        ),
      ),
    );
  }

  FutureOr<void> _linkedSkillsChanged(
    LinkedSkillsChangedEvent event,
    Emitter<CreateActivityState> emit,
  ) {
    emit(
      state.copyWith(
        activityLinkedSkills: event.activityLinkedSkills,
        isValid: _validateForm(
          state.title,
          event.activityLinkedSkills,
        ),
      ),
    );
  }

  FutureOr<void> _formSubmitted(
    ActivityFormSubmittedEvent event,
    Emitter<CreateActivityState> emit,
  ) async {
    Activity newActivity = Activity(
      id: _initialActivity?.id,
      lastUsed: _initialActivity?.lastUsed,
      title: state.title,
      cooldown: state.cooldown,
      linkedSkills: state.activityLinkedSkills,
    );

    try {
      await _activitiesRepository.saveActivity(newActivity);
    } catch (e) {}
  }
}
