import 'package:flutter/material.dart';

class TrackError extends StatelessWidget {
  const TrackError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Some problem occured'),
      ),
    );
  }
}
