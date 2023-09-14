import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HabitStackContainer extends StatelessWidget {
  const HabitStackContainer({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FaIcon(
                FontAwesomeIcons.layerGroup,
                size: 20,
                color: Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 4),
          const _HabitStackGraphic(),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    'Brush',
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Get ready',
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
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
    final canvasColor = Theme.of(context).canvasColor;

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
                backgroundColor: canvasColor,
                foregroundColor:
                    Theme.of(context).textTheme.headlineSmall!.color,
                child: const Text('1'),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: canvasColor,
                    width: 2.25,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    backgroundColor: canvasColor,
                    foregroundColor:
                        Theme.of(context).textTheme.headlineSmall!.color,
                    child: const Text('2'),
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: canvasColor,
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
