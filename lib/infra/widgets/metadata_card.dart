import 'package:flutter/material.dart';

class MetadataCard extends StatelessWidget {
  const MetadataCard({
    required this.iconData,
    required this.metadata,
    super.key,
  });

  final IconData iconData;
  final String metadata;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 8),
          child: Icon(
            iconData,
            size: 24,
            color: Colors.grey.shade700,
          ),
        ),
        Text(
          metadata,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
