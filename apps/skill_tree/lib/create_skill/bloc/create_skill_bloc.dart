import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:skill_tree/utils/color_helpers.dart';
import 'package:skills_api/models/models.dart';
import 'package:skills_api/models/skill.dart';
import 'package:skills_repository/skills_repository.dart';

part 'create_skill_event.dart';
part 'create_skill_state.dart';

class CreateSkillBloc extends Bloc<CreateSkillEvent, CreateSkillState> {
  CreateSkillBloc({
    required SkillsRepository skillsRepository,
  })  : _skillsRepository = skillsRepository,
        super(CreateSkillState(
          color: Colors.blue,
          title: '',
          description: '',
          progressDifficulty: ProgressDifficulty.medium,
          isValid: false,
        )) {
    on<TitleChanged>(_titleChanged);
    on<DescriptionChanged>(_descriptionChanged);
    on<ColorChanged>(_colorChanged);
    on<ProgressDifficultyChanged>(_progressDifficultyChanged);
    on<FormSubmitted>(_formSubmitted);
  }

  final SkillsRepository _skillsRepository;

  FutureOr<void> _titleChanged(
    TitleChanged event,
    Emitter<CreateSkillState> emit,
  ) {
    emit(
      state.copyWith(
        title: event.title,
        isValid: _validateForm(event.title),
      ),
    );
  }

  FutureOr<void> _descriptionChanged(
    DescriptionChanged event,
    Emitter<CreateSkillState> emit,
  ) {
    emit(
      state.copyWith(
        description: event.description,
        isValid: _validateForm(
          state.title,
        ),
      ),
    );
  }

  FutureOr<void> _colorChanged(
    ColorChanged event,
    Emitter<CreateSkillState> emit,
  ) {
    emit(
      state.copyWith(
        color: event.color,
        isValid: _validateForm(
          state.title,
        ),
      ),
    );
  }

  FutureOr<void> _progressDifficultyChanged(
    ProgressDifficultyChanged event,
    Emitter<CreateSkillState> emit,
  ) {
    emit(
      state.copyWith(
        progressDifficulty: event.difficulty,
        isValid: _validateForm(
          state.title,
        ),
      ),
    );
  }

  bool _validateForm(
    String title,
  ) {
    return title.isNotEmpty && title.length >= 3;
  }

  FutureOr<void> _formSubmitted(
    FormSubmitted event,
    Emitter<CreateSkillState> emit,
  ) async {
    final newSkill = Skill(
      colorCode: colorToHex(state.color),
      title: state.title,
      description: state.description,
    );

    try {
      await _skillsRepository.saveSkill(newSkill);
    } catch (e) {}
  }
}
