import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:transformx/app_ui/app_colors.dart';
import 'package:transformx/infra/infra.dart';

class TrackSuccess extends StatelessWidget {
  const TrackSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.fireBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const VSpace(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SvgPicture.asset(
                'assets/icons/fire.svg',
                semanticsLabel: 'fire illustration',
                width: 200,
                height: 200,
              ),
            ),
            Column(
              children: [
                Text(
                  'Amazing!',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
                const VSpace(),
                Text(
                  ' Habit nailed! Time to celebrate your awesome self!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  onPressed: () => context.go('/'),
                  text: 'Continue',
                  color: Colors.orange.shade100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
