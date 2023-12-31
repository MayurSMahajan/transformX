import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      radius: 20,
      child: userImg == null ? const Icon(Icons.person) : null,
    );

    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/icons/logo.png', width: 50, height: 50),
        Text('transformX', style: Theme.of(context).textTheme.bodyMedium),
        getUserImage(context),
      ],
    );
  }
}
