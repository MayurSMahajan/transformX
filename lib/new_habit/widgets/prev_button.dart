import 'package:flutter/material.dart';
// import 'package:transformx/l10n/l10n.dart';

class PrevButton extends StatelessWidget {
  const PrevButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
    return OutlinedButton(
      onPressed: onPressed,
      child: const Text('back'),
    );
  }
}
