import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:skills_api/models/skill.dart';
import 'package:skills_repository/skills_repository.dart';

part 'view_skill_event.dart';
part 'view_skill_state.dart';

class ViewSkillBloc extends Bloc<ViewSkillEvent, ViewSkillState> {
  ViewSkillBloc({
    required SkillsRepository skillsRepository,
    required String skillId,
  })  : _skillsRepository = skillsRepository,
        _skillId = skillId,
        super(const ViewSkillState()) {
    on<InitializeData>(_initializeData);
  }

  final SkillsRepository _skillsRepository;
  final String _skillId;

  FutureOr<void> _initializeData(
    InitializeData event,
    Emitter<ViewSkillState> emit,
  ) async {
    emit(state.copyWith(status: ViewSkillStatus.loading));

    try {
      await emit.forEach(
        _skillsRepository.getSkillById(_skillId),
        onData: (skill) => state.copyWith(
          skill: skill,
          status: ViewSkillStatus.loaded,
        ),
        onError: (error, stackTrace) => state.copyWith(
          status: ViewSkillStatus.error,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: ViewSkillStatus.error));
    }
  }
}
