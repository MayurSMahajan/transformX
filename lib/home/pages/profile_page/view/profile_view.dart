import 'package:flutter/material.dart';
import 'package:transformx/app_ui/app_ui.dart';
import 'package:transformx/home/pages/pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileUserInfo(),
        ProfileAccountSettings(),
        ProfilePreferences(),
      ],
    );

    return const ResponsiveLayout(
      mobileBody: child,
      desktopBody: Center(
        child: SizedBox(
          width: 500,
          height: 600,
          child: SingleChildScrollView(child: child),
        ),
      ),
    );
  }
}
