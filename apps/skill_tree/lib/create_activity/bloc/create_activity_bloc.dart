import 'dart:async';

import 'package:activities_api/activities_api.dart';
import 'package:activities_repository/activities_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:skill_tree/create_activity/model/linkable_skill_data.dart';
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
            isValid: initialActivity != null,
          ),
        ) {
    on<SkillsSubscriptionRequested>(_skillsSubscriptionRequested);
    on<TitleChangedEvent>(_titleChanged);
    on<CooldownChangedEvent>(_cooldownChanged);
    on<UpdateLinkedSkillState>(_updateLinkedSkillState);
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
        linkableSkills: buildLinkableSkills(data),
        status: CreateActivityStatus.loaded,
      ),
      onError: (error, stackTrace) => state.copyWith(
        status: CreateActivityStatus.error,
      ),
    );
  }

  List<LinkableSkillState> buildLinkableSkills(List<Skill> skills) {
    final linkableSkills = List<LinkableSkillState>.empty(growable: true);
    for (final skill in skills) {
      linkableSkills.add(LinkableSkillState(
        isSelected: false,
        linkedSkilldata: ActivityLinkedSkill(skillId: skill.id, xpReward: 5),
        skill: skill,
        skillId: skill.id,
      ));
    }
    return linkableSkills;
  }

  bool _validateForm(
    String title,
    List<LinkableSkillState> linkableSkillState,
  ) {
    return title.isNotEmpty &&
        title.length >= 3 &&
        _checkIfAtLeastOneSkillIsSelected(linkableSkillState);
  }

  bool _checkIfAtLeastOneSkillIsSelected(
    List<LinkableSkillState> linkableSkillState,
  ) {
    for (final linkableSkill in linkableSkillState) {
      if (linkableSkill.isSelected) {
        return true;
      }
    }

    return false;
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
          state.linkableSkills,
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
          state.linkableSkills,
        ),
      ),
    );
  }

  List<ActivityLinkedSkill> _getSelectedSkills() {
    final linkedSkills = List<ActivityLinkedSkill>.empty(growable: true);
    for (final linkableSkill in state.linkableSkills) {
      if (linkableSkill.isSelected) {
        linkedSkills.add(linkableSkill.linkedSkilldata);
      }
    }
    return linkedSkills;
  }

  FutureOr<void> _formSubmitted(
    ActivityFormSubmittedEvent event,
    Emitter<CreateActivityState> emit,
  ) async {
    final newActivity = Activity(
      id: _initialActivity?.id,
      lastUsed: _initialActivity?.lastUsed,
      title: state.title,
      cooldown: state.cooldown,
      linkedSkills: _getSelectedSkills(),
    );

    try {
      await _activitiesRepository.saveActivity(newActivity);
    } catch (e) {}
  }

  FutureOr<void> _updateLinkedSkillState(
      UpdateLinkedSkillState event, Emitter<CreateActivityState> emit) {
    int? index;

    for (int i = 0; i < state.linkableSkills.length; i++) {
      if (state.linkableSkills[i].skillId == event.linkableSkillState.skillId) {
        index = i;
      }
    }

    if (index == null) return null;

    final newLinkableSkills = [...state.linkableSkills];
    newLinkableSkills[index] = event.linkableSkillState;

    emit(
      state.copyWith(
        linkableSkills: newLinkableSkills,
        isValid: _validateForm(
          state.title,
          newLinkableSkills,
        ),
      ),
    );
  }
}
