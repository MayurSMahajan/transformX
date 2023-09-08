import 'package:flutter/material.dart';
import 'package:habits_api/habits_api.dart';
import 'package:transformx/new_habit/widgets/widgets.dart';

const metricMinOffset = 5;
const metricIdealOffset = 10;

class MetricPickerWidgetWrapper extends StatelessWidget {
  const MetricPickerWidgetWrapper({required this.onMetricSelected, super.key});

  final ValueSetter<Metric> onMetricSelected;

  @override
  Widget build(BuildContext context) {
    return MetricPickerWidget(onMetricSelected: onMetricSelected);
  }
}

class MetricPickerWidget extends StatefulWidget {
  const MetricPickerWidget({required this.onMetricSelected, super.key});

  final ValueSetter<Metric> onMetricSelected;

  @override
  State<MetricPickerWidget> createState() => _MetricPickerWidgetState();
}

class _MetricPickerWidgetState extends State<MetricPickerWidget> {
  late FixedExtentScrollController _idealController;
  late FixedExtentScrollController _minimumController;

  @override
  void initState() {
    super.initState();
    _idealController = FixedExtentScrollController();
    _minimumController = FixedExtentScrollController();
  }

  @override
  void dispose() {
    _idealController.dispose();
    _minimumController.dispose();
    super.dispose();
  }

  void submitMetric() {
    final habitMetric = Metric(
      minimum: _minimumController.selectedItem + metricMinOffset,
      ideal: _idealController.selectedItem + metricIdealOffset,
    );
    widget.onMetricSelected(habitMetric);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      height: 330,
      child: Column(
        children: [
          const _MetricTypeLabel(),
          SizedBox(
            height: 220,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const BottomSheetOverlay(),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BottomSheetWheel(
                        controller: _minimumController,
                        offset: metricMinOffset,
                        childCount: 31,
                      ),
                      const SizedBox(width: 45),
                      BottomSheetWheel(
                        controller: _idealController,
                        offset: metricIdealOffset,
                        childCount: 56,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomSheetButton(onPressed: submitMetric),
        ],
      ),
    );
  }
}

class _MetricTypeLabel extends StatelessWidget {
  const _MetricTypeLabel();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'min ',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(width: 45),
            Text(
              ' ideal',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ],
    );
  }
}
