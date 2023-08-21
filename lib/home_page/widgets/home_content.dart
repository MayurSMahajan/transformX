import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transformx/infra/infra.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          VSpace(),
          GreetingContainer(),
          VSpace(),
          DailyStreakContainer(),
          VSpace(),
          HabitListContainer(),
        ],
      ),
    );
  }
}

class HabitListContainer extends StatelessWidget {
  const HabitListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VSpace(),
        Text(
          'habits',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const VSpace(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HabitCard(),
            NewHabitCardBtn(),
          ],
        )
      ],
    );
  }
}

class HabitCard extends StatelessWidget {
  const HabitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).canvasColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).primaryColor,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.sports_gymnastics,
                  size: 22,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'go to gym and gym',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.timelapse,
                    size: 24,
                  ),
                ),
                Text(
                  '06:00 AM',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.pin_drop_outlined,
                    size: 24,
                  ),
                ),
                Text(
                  'gym ',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NewHabitCardBtn extends StatelessWidget {
  const NewHabitCardBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).canvasColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: InkWell(
          onTap: () => context.go('/new'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add,
                size: 54,
              ),
              const VSpace(),
              Text(
                'new habit',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DailyStreakContainer extends StatelessWidget {
  const DailyStreakContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).canvasColor,
      ),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DailyStreakCard(day: 'Mo', isActive: true),
            DailyStreakCard(day: 'Tu', isActive: true),
            DailyStreakCard(day: 'We'),
            DailyStreakCard(day: 'Th', isActive: true),
            DailyStreakCard(day: 'Fr', isActive: true),
            DailyStreakCard(day: 'Sa', isActive: true),
            DailyStreakCard(day: 'Su'),
          ],
        ),
      ),
    );
  }
}

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
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const VSpace(),
        if (isActive)
          Image.asset('assets/icons/streak_active.png')
        else
          Image.asset('assets/icons/streak_inactive.png')
      ],
    );
  }
}

class GreetingContainer extends StatelessWidget {
  const GreetingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'good morning',
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
        Text(
          'TransformX',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings),
        )
      ],
    );
  }
}
