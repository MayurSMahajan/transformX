import 'package:flutter/material.dart';

class EditRoundedButton extends StatelessWidget {
  const EditRoundedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(
        Icons.edit_rounded,
        size: 18,
        color: Colors.white,
      ),
    );
  }
}
