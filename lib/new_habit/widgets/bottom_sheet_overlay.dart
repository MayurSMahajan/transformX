import 'package:flutter/material.dart';

class BottomSheetOverlay extends StatelessWidget {
  const BottomSheetOverlay({super.key, this.paddingTop = 20});

  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
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
