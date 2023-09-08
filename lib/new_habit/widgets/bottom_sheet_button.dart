import 'package:flutter/material.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressed,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text('Done'),
      ),
    );
  }
}
