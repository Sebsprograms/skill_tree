import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skills_api/models/models.dart';
import 'package:skills_repository/skills_repository.dart';

part 'skills_event.dart';
part 'skills_state.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  SkillsBloc({
    required SkillsRepository skillsRepository,
  })  : _skillsRepository = skillsRepository,
        super(const SkillsState()) {
    on<SkillsSubscriptionRequested>(_skillsSubscriptionRequested);
    on<SkillsSubmittedNewSkill>(_skillsSubmittedNewSkill);
  }

  final SkillsRepository _skillsRepository;

  FutureOr<void> _skillsSubscriptionRequested(
    SkillsSubscriptionRequested event,
    Emitter<SkillsState> emit,
  ) async {
    emit(
      state.copyWith(status: SkillsStatus.loading),
    );

    await emit.forEach(
      _skillsRepository.getSkills(),
      onData: (skills) => state.copyWith(
        status: SkillsStatus.loaded,
        skills: skills,
      ),
      onError: (error, stackTrace) => state.copyWith(
        status: SkillsStatus.error,
      ),
    );
  }

  FutureOr<void> _skillsSubmittedNewSkill(
    SkillsSubmittedNewSkill event,
    Emitter<SkillsState> emit,
  ) async {
    emit(state.copyWith(status: SkillsStatus.loading));

    final newSkill = Skill(
      colorCode: event.colorHex,
      title: event.title,
      description: event.description ?? '',
      progressDifficulty: event.difficulty,
    );

    try {
      await _skillsRepository.saveSkill(newSkill);
      emit(state.copyWith(status: SkillsStatus.loaded));
    } catch (e) {
      emit(state.copyWith(status: SkillsStatus.error));
    }
  }
}
