import 'package:flutter/material.dart';
// import 'package:transformx/l10n/l10n.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
