import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transformx/l10n/l10n.dart';

class NewHabitCardBtn extends StatelessWidget {
  const NewHabitCardBtn({super.key, this.isPrimary = false});

  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (isPrimary) {
      return ElevatedButton.icon(
        onPressed: () => context.go('/new'),
        icon: const Icon(Icons.add),
        label: Text(l10n.newHabit),
      );
    }
    return TextButton.icon(
      onPressed: () => context.go('/new'),
      icon: const Icon(Icons.add),
      label: Text(l10n.newHabit),
    );
  }
}
