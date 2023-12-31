import 'package:flutter/material.dart';

class ProfileAccountSettings extends StatelessWidget {
  const ProfileAccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account Settings',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Container(
            decoration: const BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Logout',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.logout),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Change Email',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.email_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
