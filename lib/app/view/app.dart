import 'package:flutter/material.dart';
import 'package:transformx/l10n/l10n.dart';
import 'package:transformx/new_habit/new_habit.dart';
import 'package:transformx/themes/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: const AppTheme().themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const NewHabitPage(),
    );
  }
}
