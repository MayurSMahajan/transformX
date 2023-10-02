import 'package:flutter/material.dart';

class Languages {
  List<String> get languages => <String>['English', 'हिंदी', '日本語', 'Deutsch'];

  Locale getLocaleFromString(String lang) {
    switch (lang) {
      case 'हिंदी':
        return const Locale('hi');
      case '日本語':
        return const Locale('ja');
      case 'Deutsch':
        return const Locale('de');
      default:
        return const Locale('en');
    }
  }
}
