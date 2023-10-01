import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({super.key});

  Widget getUserImage(BuildContext context) {
    final userImg = context.read<AuthenticationRepository>().savedUser.photo;
    final widget = CircleAvatar(
      backgroundImage: userImg != null
          ? NetworkImage(
              userImg,
            )
          : null,
      radius: 50,
      child: userImg == null ? const Icon(Icons.person, size: 100) : null,
    );

    return widget;
  }

  String getUserName(BuildContext context) {
    return context.read<AuthenticationRepository>().savedUser.name ??
        'your username will appear here';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      height: 240,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getUserImage(context),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              getUserName(context),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          const SizedBox(height: 12),
          FilledButton.tonal(
            onPressed: () {},
            child: const Text('Edit Profile'),
          ),
        ],
      ),
    );
  }
}
