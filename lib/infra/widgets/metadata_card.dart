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
    return SizedBox(
      width: 160,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8, bottom: 8),
            child: icon,
          ),
          Expanded(
            child: Text(
              metadata,
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
