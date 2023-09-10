import 'package:flutter/material.dart';
import 'package:transformx/infra/infra.dart';

class HabitRitualContainer extends StatefulWidget {
  const HabitRitualContainer({required this.ritual, super.key});

  final String ritual;

  @override
  State<HabitRitualContainer> createState() => _HabitRitualContainerState();
}

class _HabitRitualContainerState extends State<HabitRitualContainer> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MetadataCard(
                icon: Image.asset(
                  'assets/icons/stack.png',
                  width: 22,
                  height: 22,
                ),
                metadata: 'Habit Ritual',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.ritual,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      decoration: isChecked ? TextDecoration.lineThrough : null,
                    ),
              ),
              Checkbox(
                fillColor: const MaterialStatePropertyAll(Colors.amber),
                value: isChecked,
                onChanged: (value) {
                  setState(() => isChecked = value!);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
