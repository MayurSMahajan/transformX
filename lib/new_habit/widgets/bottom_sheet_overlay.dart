import 'package:flutter/material.dart';

class BottomSheetOverlay extends StatelessWidget {
  const BottomSheetOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Container(
        height: 60,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.amber.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
