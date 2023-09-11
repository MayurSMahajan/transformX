import 'package:flutter/material.dart';
import 'package:transformx/l10n/l10n.dart';

class GreetingContainer extends StatelessWidget {
  const GreetingContainer({super.key});

  String getGreetingMessage(BuildContext context) {
    final l10n = context.l10n;

    final hour = DateTime.now().hour;
    if (hour > 18 || hour < 6) {
      return 'good evening';
    }
    if (hour < 13) {
      return l10n.goodMorningGreet;
    }
    return 'good afternoon';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      getGreetingMessage(context),
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
