import 'package:shared_preferences/shared_preferences.dart';

/// {@template local_storage_preferences_api}
/// A Flutter package that uses local storage to store user preferences.
/// {@endtemplate}
class LocalStoragePreferencesApi {
  /// {@macro local_storage_preferences_api}
  const LocalStoragePreferencesApi({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  final SharedPreferences _prefs;

  /// Sets the selected app theme.
  Future<void> setTheme(String theme) async {
    await _prefs.setString('theme', theme);
  }

  /// Retrieves the selected app theme.
  Future<String> getTheme() async {
    return _prefs.getString('theme') ?? 'light';
  }

  /// Sets the selected app language.
  Future<void> setLanguage(String language) async {
    await _prefs.setString('language', language);
  }

  /// Retrieves the selected app language.
  Future<String> getLanguage() async {
    return _prefs.getString('language') ?? 'en';
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
