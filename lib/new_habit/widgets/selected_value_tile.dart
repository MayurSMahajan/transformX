import 'package:flutter/material.dart';
import 'package:transformx/app_ui/app_ui.dart';

class SelectedValueTile extends StatelessWidget {
  const SelectedValueTile({
    required this.label,
    required this.amount,
    required this.subLabel,
    super.key,
  });

  final String label;
  final String amount;
  final String subLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Spacer(),
        Text(
          amount,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            subLabel,
            style: UITextStyle.headline6.copyWith(
              color: AppColors.mediumEmphasisSurface,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
