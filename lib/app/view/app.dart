import 'package:flutter/material.dart';
import 'package:transformx/app/app.dart';
import 'package:transformx/l10n/l10n.dart';
import 'package:transformx/themes/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.light,
      theme: const AppTheme().themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: routerConfig,
    );
  }
}
