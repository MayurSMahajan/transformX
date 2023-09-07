import 'package:flutter/material.dart';
import 'package:habits_api/habits_api.dart';
import 'package:transformx/infra/infra.dart';

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

  void submitTime(BuildContext context) {
    final habitMetric = Metric(
      minimum: _minimumController.selectedItem,
      ideal: _idealController.selectedItem,
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
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ideal ',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const HSpace(),
              const HSpace(),
              Text(
                ' min',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          SizedBox(
            height: 220,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 70,
                        child: ListWheelScrollView.useDelegate(
                          controller: _idealController,
                          itemExtent: 54,
                          perspective: 0.005,
                          diameterRatio: 1.2,
                          physics: const FixedExtentScrollPhysics(),
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 60,
                            builder: (context, index) {
                              return MetricIdeal(
                                hours: index,
                              );
                            },
                          ),
                        ),
                      ),
                      const HSpace(),
                      const HSpace(),
                      SizedBox(
                        width: 70,
                        child: ListWheelScrollView.useDelegate(
                          controller: _minimumController,
                          itemExtent: 54,
                          perspective: 0.005,
                          diameterRatio: 1.2,
                          physics: const FixedExtentScrollPhysics(),
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 60,
                            builder: (context, index) {
                              return MetricMinimum(
                                mins: index,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          FilledButton.tonal(
            onPressed: () => submitTime(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('Done'),
            ),
          ),
        ],
      ),
    );
  }
}

class MetricIdeal extends StatelessWidget {
  const MetricIdeal({required this.hours, super.key});

  final int hours;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: Text(
          hours.toString(),
          style: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MetricMinimum extends StatelessWidget {
  const MetricMinimum({required this.mins, super.key});

  final int mins;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: Text(
          mins < 10 ? '0$mins' : mins.toString(),
          style: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
