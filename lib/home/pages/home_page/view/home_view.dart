import 'package:flutter/material.dart';
import 'package:transformx/home/pages/home_page/widgets/widgets.dart';
import 'package:transformx/infra/infra.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
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
          style: Theme.of(context).textTheme.headlineSmall,
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
        padding: EdgeInsets.all(16),
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

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'TransformX',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.amberAccent,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_2),
          ),
        )
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
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
