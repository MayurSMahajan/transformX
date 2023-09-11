import 'package:flutter/material.dart';
import 'package:transformx/home/pages/pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileUserInfo(),
        ProfileAccountSettings(),
        ProfilePreferences(),
      ],
    );
  }
}
