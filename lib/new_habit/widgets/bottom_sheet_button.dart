import 'package:flutter/material.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    required this.onPressed,
    this.label = 'Done',
    super.key,
  });

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(label),
      ),
    );
  }
}
