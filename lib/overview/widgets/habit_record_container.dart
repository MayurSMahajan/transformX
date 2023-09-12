import 'package:flutter/material.dart';
import 'package:habits_api/habits_api.dart';
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
              MetadataCard(
                icon: Image.asset(
                  'assets/icons/badge.png',
                  width: 22,
                  height: 22,
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
          Stack(
            children: [
              CustomProgressIndicator(
                progress: (widget.stats.weeklyRecord / 7) - 0.21,
                minHeight: 24,
              ),
              Positioned(
                left: 30,
                bottom: 1,
                child: Text(
                  _getStatsAccordingToLabel(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  String _getStatsAccordingToLabel() {
    switch (dropdownValue) {
      case 'weekly':
        return '${widget.stats.weeklyRecord} days';
      case 'monthly':
        return '${widget.stats.monthlyRecord} days';
      case 'yearly':
        return '${widget.stats.yearlyRecord} days';
      default:
        return '${widget.stats.allTimeRecord} days';
    }
  }
}
