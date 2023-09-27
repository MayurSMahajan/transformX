import 'package:flutter_test/flutter_test.dart';
import 'package:local_preferences_repository/local_preferences_repository.dart';

void main() {
  group('LocalPreferencesRepository Tests', () {
    late SharedPreferences sharedPreferences;
    late LocalPreferencesRepository preferencesApi;

    setUpAll(() async {
      SharedPreferences.setMockInitialValues({});
    });

    setUp(() async {
      sharedPreferences = await SharedPreferences.getInstance();
      preferencesApi = LocalPreferencesRepository(prefs: sharedPreferences);
    });

    tearDown(() async {
      await sharedPreferences.clear();
    });

    test('Get Default Theme', () async {
      final theme = await preferencesApi.getTheme();
      expect(theme, 'light');
    });

    test('Get Default Language', () async {
      final language = await preferencesApi.getLanguage();
      expect(language, 'en');
    });

    test('Get Default Show Onboarding', () async {
      final showOnboarding = await preferencesApi.getShowOnboarding();
      expect(showOnboarding, true);
    });

    test('Set and Get Theme', () async {
      await preferencesApi.setTheme('dark');
      final theme = await preferencesApi.getTheme();
      expect(theme, 'dark');
    });

    test('Set and Get Language', () async {
      await preferencesApi.setLanguage('hi');
      final language = await preferencesApi.getLanguage();
      expect(language, 'hi');
    });

    test('Set and Get Show Onboarding', () async {
      await preferencesApi.setShowOnboarding();
      final showOnboarding = await preferencesApi.getShowOnboarding();
      expect(showOnboarding, false);
    });
  });
}
