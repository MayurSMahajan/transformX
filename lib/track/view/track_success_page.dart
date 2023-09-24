import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transformx/infra/infra.dart';

class TrackSuccess extends StatefulWidget {
  const TrackSuccess({super.key});

  @override
  State<TrackSuccess> createState() => _TrackSuccessState();
}

class _TrackSuccessState extends State<TrackSuccess>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const VSpace(),
              AnimatedIconButton(
                animationController: _controller,
                size: 128,
                duration: const Duration(milliseconds: 500),
                onPressed: () {},
                icons: const <AnimatedIconItem>[
                  AnimatedIconItem(
                    icon: Icon(
                      Icons.lock_open_outlined,
                      size: 128,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Reward Unlocked',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const VSpace(),
                  Text(
                    'Habit Nailed, Enjoy your Reward',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              PrimaryButton(
                onPressed: () => context.go('/'),
                text: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
