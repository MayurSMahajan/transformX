import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:local_preferences_repository/local_preferences_repository.dart';

part 'preferences_state.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  PreferencesCubit({
    required LocalPreferencesRepository localPreferencesRepository,
  })  : _preferencesRepository = localPreferencesRepository,
        super(const PreferencesState());

  final LocalPreferencesRepository _preferencesRepository;

  Future<void> getDefaultPreferences() async {
    final themeString = await _preferencesRepository.getTheme();
    final locale = await _preferencesRepository.getLanguage();
    final themeMode = _stringToThemeMode(themeString);

    emit(state.copyWith(locale: Locale(locale), themeMode: themeMode));
  }

  Future<void> changeLocale(Locale locale) async {
    await _preferencesRepository.setLanguage(locale.languageCode);
    emit(state.copyWith(locale: locale));
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    await _preferencesRepository.setTheme(_themeModeToString(themeMode));
    emit(state.copyWith(themeMode: themeMode));
  }

  Future<String> getSavedLanguage() async {
    final savedLanguage = await _preferencesRepository.getLanguage();
    return savedLanguage;
  }

  Future<String> getSavedThemeMode() async {
    final savedTheme = await _preferencesRepository.getTheme();
    return savedTheme;
  }

  String _themeModeToString(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }

  ThemeMode _stringToThemeMode(String themeString) {
    switch (themeString) {
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }
}
