import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/app/cubit/preferences_cubit.dart';
import 'package:transformx/home/pages/profile_page/utils/utils.dart';

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
              padding: const EdgeInsets.symmetric(vertical: 8),
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
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    final isCurrentModeDark = context.read<PreferencesCubit>().isDarkMode;
    setState(
      () => isDarkMode = isCurrentModeDark,
    );
  }

  void changeTheme({required bool value}) {
    setState(
      () => isDarkMode = value,
    );

    final themeMode = value ? ThemeMode.dark : ThemeMode.light;
    context.read<PreferencesCubit>().changeTheme(themeMode);
  }

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
          value: isDarkMode,
          onChanged: (v) => changeTheme(value: v),
        ),
      ],
    );
  }
}

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String dropdownValue = 'English';
  final langs = Languages();
  late List<String> options;

  @override
  void initState() {
    super.initState();
    options = langs.languages;
    setState(() {
      dropdownValue = langs.getStringFromLocale(
        context.read<PreferencesCubit>().currentLocale,
      );
    });
  }

  void updateLanguage(String? value) {
    setState(() {
      dropdownValue = value!;
    });
    if (value != null) {
      context
          .read<PreferencesCubit>()
          .changeLocale(langs.getLocaleFromString(value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      trailingIcon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.grey,
      ),
      initialSelection: dropdownValue,
      onSelected: updateLanguage,
      dropdownMenuEntries: options.map<DropdownMenuEntry<String>>((String v) {
        return DropdownMenuEntry<String>(value: v, label: v);
      }).toList(),
    );
  }
}
