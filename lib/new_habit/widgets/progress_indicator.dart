import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
    this.progress = 0.25, // Set the initial progress value (0 to 1)
    this.duration = const Duration(milliseconds: 300),
  });
  final double progress;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        clipBehavior: Clip.hardEdge,
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: progress, end: progress + 0.23),
          duration: duration,
          builder: (context, value, child) {
            return LinearProgressIndicator(
              value: value,
              minHeight: 20,
              backgroundColor: Colors.amber.shade100,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color.fromRGBO(255, 207, 35, 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
