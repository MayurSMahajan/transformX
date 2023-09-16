import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/home/pages/home_page/home_page.dart';
import 'package:transformx/infra/infra.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
            DailyStreakContainerWrapper(),
            VSpace(),
            HabitListContainer(),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  Widget getUserImage(BuildContext context) {
    final userImg = context.read<AuthenticationRepository>().savedUser.photo;
    final widget = CircleAvatar(
      backgroundImage: userImg != null
          ? NetworkImage(
              userImg,
            )
          : null,
      radius: 22.5,
      child: userImg == null ? const Icon(Icons.person) : null,
    );

    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'TransformX',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        getUserImage(context),
      ],
    );
  }
}
