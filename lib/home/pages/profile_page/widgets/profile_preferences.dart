import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePreferences extends StatelessWidget {
  const ProfilePreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Preferences',
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
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Language',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const LanguageDropdown(),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const DarkModeOption()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DarkModeOption extends StatefulWidget {
  const DarkModeOption({
    super.key,
  });

  @override
  State<DarkModeOption> createState() => _DarkModeOptionState();
}

class _DarkModeOptionState extends State<DarkModeOption> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Dark Mode',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        CupertinoSwitch(
          activeColor: Colors.amber,
          value: value,
          onChanged: (v) => setState(
            () => value = v,
          ),
        ),
      ],
    );
  }
}

const List<String> list = ['English', 'Hindi', 'Japanese', 'German'];

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String v) {
        return DropdownMenuEntry<String>(value: v, label: v);
      }).toList(),
    );
  }
}
