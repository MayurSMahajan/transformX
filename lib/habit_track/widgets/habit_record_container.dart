import 'package:flutter/material.dart';
import 'package:transformx/infra/infra.dart';

class HabitRecordContainer extends StatelessWidget {
  const HabitRecordContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MetadataCard(
                icon: Image.asset(
                  'assets/icons/badge.png',
                  width: 22,
                  height: 22,
                ),
                metadata: 'Record',
              ),
              TextButton(
                child: const Text('weekly'),
                onPressed: () {},
              ),
            ],
          ),
          Stack(
            children: [
              const CustomProgressIndicator(
                progress: 0.65,
                minHeight: 24,
              ),
              Positioned(
                left: 30,
                bottom: 1,
                child: Text(
                  '6/7 days',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
