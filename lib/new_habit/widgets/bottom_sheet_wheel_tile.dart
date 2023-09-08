import 'package:flutter/material.dart';

class MetricValue extends StatelessWidget {
  const MetricValue({required this.value, super.key});

  final int value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: Text(
          value < 10 ? '0$value' : value.toString(),
          style: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
