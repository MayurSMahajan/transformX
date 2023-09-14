import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DailyStreakCard extends StatelessWidget {
  const DailyStreakCard({
    required this.day,
    this.isActive = false,
    super.key,
  });

  final String day;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        if (isActive)
          const FaIcon(
            FontAwesomeIcons.fire,
            size: 20,
            color: Colors.orange,
          )
        else
          const FaIcon(
            FontAwesomeIcons.fire,
            size: 20,
            color: Colors.grey,
          )
      ],
    );
  }
}
