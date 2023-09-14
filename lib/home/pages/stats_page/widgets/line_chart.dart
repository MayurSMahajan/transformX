import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProgressLineChart extends StatefulWidget {
  const ProgressLineChart({
    required this.spots,
    super.key,
  });

  final List<FlSpot> spots;

  @override
  State<ProgressLineChart> createState() => _ProgressLineChartState();
}

class _ProgressLineChartState extends State<ProgressLineChart> {
  late List<LineChartBarData> lines;

  @override
  void initState() {
    super.initState();
    lines = [
      LineChartBarData(
        spots: widget.spots,
        color: Colors.amber,
        isCurved: true,
        isStrokeCapRound: true,
        barWidth: 2.2,
        dotData: FlDotData(
          getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
            radius: 5,
            color: Colors.amber,
            strokeColor: Colors.amber,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      child: AspectRatio(
        aspectRatio: 1.4,
        child: LineChart(
          LineChartData(
            lineTouchData: const LineTouchData(enabled: false),
            lineBarsData: lines,
            minX: 0,
            maxX: 8,
            minY: 0,
            maxY: 7,
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  reservedSize: 32,
                  showTitles: true,
                  getTitlesWidget: leftTitleWidgets,
                ),
              ),
              rightTitles: const AxisTitles(),
              bottomTitles: const AxisTitles(),
              topTitles: const AxisTitles(),
            ),
            gridData: const FlGridData(
              drawVerticalLine: false,
              horizontalInterval: 1,
            ),
            borderData: FlBorderData(
              show: true,
              border: const Border(
                left: BorderSide(color: Colors.brown),
                bottom: BorderSide(color: Colors.brown),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Min';
      case 1:
        text = '10';
      case 2:
        text = '20';
      case 3:
        text = '30';
      case 4:
        text = '40';
      case 5:
        text = '50';
      case 6:
        text = '60';
      default:
        return Container();
    }

    return Padding(
      padding: const EdgeInsets.only(right: 2),
      child: Text(text, style: style, textAlign: TextAlign.left),
    );
  }
}
