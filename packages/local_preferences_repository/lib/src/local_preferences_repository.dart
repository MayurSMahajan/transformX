import 'package:shared_preferences/shared_preferences.dart';

/// {@template local_preferences_repository}
/// A Flutter package that uses local storage to store user preferences.
/// {@endtemplate}
class LocalPreferencesRepository {
  /// {@macro local_preferences_repository}
  const LocalPreferencesRepository({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  final SharedPreferences _prefs;

  /// Sets the selected app theme.
  Future<void> setTheme(String theme) async {
    await _prefs.setString('theme', theme);
  }

  /// Retrieves the selected app theme.
  Future<String> getTheme() async {
    return _prefs.getString('theme') ?? 'dark';
  }

  /// Sets the selected app language.
  Future<void> setLanguage(String language) async {
    await _prefs.setString('language', language);
  }

  /// Retrieves the selected app language.
  Future<String> getLanguage() async {
    return _prefs.getString('language') ?? 'ja';
  }

  /// Sets whether to show the onboarding screen.
  Future<void> setShowOnboarding({bool show = false}) async {
    await _prefs.setBool('show_onboarding', show);
  }

  /// Retrieves whether to show the onboarding screen.
  Future<bool> getShowOnboarding() async {
    return _prefs.getBool('show_onboarding') ?? true;
  }
}
