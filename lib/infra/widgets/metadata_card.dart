import 'package:flutter/material.dart';

class MetadataCard extends StatelessWidget {
  const MetadataCard({
    required this.icon,
    required this.metadata,
    super.key,
  });

  final Widget icon;
  final String metadata;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: icon,
        ),
        Text(
          metadata,
          style: Theme.of(context).textTheme.titleMedium,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
