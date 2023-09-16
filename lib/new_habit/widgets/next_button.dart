import 'package:flutter/material.dart';
import 'package:transformx/l10n/l10n.dart';

class NextButton extends StatelessWidget {
  const NextButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(l10n.nextActionButton),
    );
  }
}
