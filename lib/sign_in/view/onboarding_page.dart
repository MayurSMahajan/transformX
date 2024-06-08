import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transformx/l10n/l10n.dart';
import 'package:transformx/sign_in/cubit/sign_in_cubit.dart';
import 'package:transformx/sign_in/widgets/widgets.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();
  bool onLastPage = false;

  void goToNextPage(BuildContext context) {
    if (onLastPage) {
      context.read<SignInCubit>().setShowOnboarding();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }

  void goToLastPage() {
    _controller.jumpToPage(2);
  }

  void goToBackPage() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: const Alignment(0, -0.9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: goToLastPage,
                child: const Text('Skip'),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
        PageView(
          controller: _controller,
          onPageChanged: (value) {
            setState(() {
              onLastPage = (value == 2);
            });
          },
          children: const [
            _GardenPage(),
            _LoopPage(),
            _JourneyPage(),
          ],
        ),
        Container(
          alignment: const Alignment(0, 0.925),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: goToBackPage,
                child: const Text('Back'),
              ),
              SmoothPageIndicator(controller: _controller, count: 3),
              TextButton(
                onPressed: () => goToNextPage(context),
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _JourneyPage extends StatelessWidget {
  const _JourneyPage();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PageViewLayout(
      imagePath: 'assets/illustrations/journey.svg',
      title: l10n.journeyTitle,
      subtitle: l10n.journeySubTitle,
    );
  }
}

class _LoopPage extends StatelessWidget {
  const _LoopPage();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PageViewLayout(
      imagePath: 'assets/illustrations/loop.svg',
      title: l10n.loopTitle,
      subtitle: l10n.loopSubTitle,
    );
  }
}

class _GardenPage extends StatelessWidget {
  const _GardenPage();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PageViewLayout(
      imagePath: 'assets/illustrations/garden.svg',
      title: l10n.gardenTitle,
      subtitle: l10n.gardenSubTitle,
    );
  }
}
