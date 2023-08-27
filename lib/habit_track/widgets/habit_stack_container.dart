import 'package:flutter/material.dart';
import 'package:transformx/infra/infra.dart';

class HabitStackContainer extends StatelessWidget {
  const HabitStackContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
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
                metadata: 'Habit Stack',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.question_mark_outlined,
                  color: Colors.grey,
                  size: 16,
                ),
              )
            ],
          ),
          const VSpace(),
          const _HabitStackGraphic(),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Brush',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'go to the gym',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                Text(
                  'Bath',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HabitStackGraphic extends StatelessWidget {
  const _HabitStackGraphic();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Container(
              height: 2,
              color: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).canvasColor,
                foregroundColor:
                    Theme.of(context).textTheme.headlineSmall!.color,
                child: const Text('1'),
              ),
              CircleAvatar(
                backgroundColor: Theme.of(context).canvasColor,
                foregroundColor:
                    Theme.of(context).textTheme.headlineSmall!.color,
                child: const Text('2'),
              ),
              CircleAvatar(
                backgroundColor: Theme.of(context).canvasColor,
                foregroundColor:
                    Theme.of(context).textTheme.headlineSmall!.color,
                child: const Text('3'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
