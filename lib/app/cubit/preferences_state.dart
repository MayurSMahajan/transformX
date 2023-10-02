part of 'preferences_cubit.dart';

final class PreferencesState extends Equatable {
  const PreferencesState({
    this.locale = const Locale('en'),
    this.themeMode = ThemeMode.light,
  });

  final ThemeMode themeMode;
  final Locale locale;

  ThemeMode get currentTheme => themeMode;
  Locale get currentLocale => locale;

  PreferencesState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
  }) {
    return PreferencesState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object> get props => [themeMode, locale];
}
