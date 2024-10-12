import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'create_skill_event.dart';
part 'create_skill_state.dart';

class CreateSkillBloc extends Bloc<CreateSkillEvent, CreateSkillState> {
  CreateSkillBloc()
      : super(CreateSkillState(
          color: Colors.blue,
          title: '',
          description: '',
          isValid: false,
        )) {
    on<TitleChanged>(_titleChanged);
    on<DescriptionChanged>(_descriptionChanged);
    on<ColorChanged>(_colorChanged);
  }

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

  bool _validateForm(
    String title,
  ) {
    return title.isNotEmpty && title.length >= 3;
  }
}
