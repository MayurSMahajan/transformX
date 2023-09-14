import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habits_api/habits_api.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:transformx/infra/infra.dart';
// import 'package:transformx/l10n/l10n.dart';

const List<String> recordLabels = ['weekly', 'monthly', 'yearly', 'all time'];

class HabitRecordContainer extends StatefulWidget {
  const HabitRecordContainer({
    required this.stats,
    super.key,
  });

  final Stats stats;

  @override
  State<HabitRecordContainer> createState() => _HabitRecordContainerState();
}

class _HabitRecordContainerState extends State<HabitRecordContainer> {
  String dropdownValue = recordLabels.first;
  late final double weeklyPercent;
  late final double monthlyPercent;
  late final double yearlyPercent;

  @override
  void initState() {
    super.initState();
    weeklyPercent = widget.stats.weeklyRecord / 7;
    monthlyPercent = widget.stats.monthlyRecord / 30;
    yearlyPercent = widget.stats.yearlyRecord / 365;
  }

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MetadataCard(
                icon: FaIcon(
                  FontAwesomeIcons.medal,
                  color: Colors.grey,
                  size: 22,
                ),
                metadata: 'Record',
              ),
              DropdownMenu<String>(
                inputDecorationTheme: const InputDecorationTheme(
                  enabledBorder: InputBorder.none,
                ),
                initialSelection: recordLabels.first,
                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                dropdownMenuEntries:
                    recordLabels.map<DropdownMenuEntry<String>>((String v) {
                  return DropdownMenuEntry<String>(value: v, label: v);
                }).toList(),
              ),
            ],
          ),
          LinearPercentIndicator(
            animation: true,
            animationDuration: 1000,
            lineHeight: 24,
            percent: _getPercentValue(),
            center: Text(_getPercentText()),
            progressColor: Theme.of(context).primaryColor,
            backgroundColor: Theme.of(context).canvasColor,
            barRadius: const Radius.circular(4),
          ),
        ],
      ),
    );
  }

  String _getPercentText() {
    switch (dropdownValue) {
      case 'weekly':
        return '${(weeklyPercent * 100).toStringAsFixed(2)}%';
      case 'monthly':
        return '${(monthlyPercent * 100).toStringAsFixed(2)}%';
      case 'yearly':
        return '${(yearlyPercent * 100).toStringAsFixed(2)}%';
      default:
        return '${widget.stats.allTimeRecord} days';
    }
  }

  double _getPercentValue() {
    switch (dropdownValue) {
      case 'weekly':
        return weeklyPercent;
      case 'monthly':
        return monthlyPercent;
      case 'yearly':
        return yearlyPercent;
      default:
        return 0.95;
    }
  }
}
