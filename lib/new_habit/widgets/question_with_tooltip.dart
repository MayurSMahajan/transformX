import 'package:flutter/material.dart';
import 'package:transformx/new_habit/new_habit.dart';

class QuestionWithTooltip extends StatelessWidget {
  const QuestionWithTooltip({required this.message, super.key});

  final String message;

  void _show(BuildContext ctx) {
    showModalBottomSheet<BottomSheet>(
      elevation: 10,
      context: ctx,
      builder: (ctx) => TooltipBuilder(message: message),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () => _show(context),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(),
          ),
          child: const Icon(
            Icons.question_mark,
            size: 20,
          ),
        ),
      ),
    );
  }
}

class TooltipBuilder extends StatelessWidget {
  const TooltipBuilder({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      height: 200,
      color: Theme.of(context).canvasColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            message,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          BottomSheetButton(
            onPressed: () => Navigator.of(context).pop(),
            label: 'Dismiss',
          ),
        ],
      ),
    );
  }
}
