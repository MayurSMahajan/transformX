import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.onPressed,
    required this.text,
    this.color,
    super.key,
  });

  final VoidCallback onPressed;
  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context)
          .elevatedButtonTheme
          .style
          ?.copyWith(backgroundColor: WidgetStatePropertyAll(color)),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
