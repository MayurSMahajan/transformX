import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transformx/infra/widgets/vspace.dart';

class NewHabitCardBtn extends StatelessWidget {
  const NewHabitCardBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).canvasColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: InkWell(
          onTap: () => context.go('/new'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add,
                size: 54,
              ),
              const VSpace(),
              Text(
                'new habit',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
