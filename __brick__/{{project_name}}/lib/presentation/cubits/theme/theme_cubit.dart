// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:{{project_name}}/data/preferences_key.dart';
import 'package:{{project_name}}/domain/repositories/preferences_repository.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final PreferencesRepository preferencesRepository;

  ThemeCubit({required this.preferencesRepository}) : super(ThemeMode.system) {
    _init();
  }

  Future<void> _init() async {
    final themeMode = await preferencesRepository.read(
      PreferencesKey.themeMode,
    );
    emit(themeMode ?? ThemeMode.system);
  }

  void toggleTheme(ThemeMode themeMode) {
    preferencesRepository.write(PreferencesKey.themeMode, themeMode);
    emit(themeMode);
  }
}
