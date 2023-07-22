import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../models/widgets/pie_chart_model.dart';

class ChartPieChart extends StatefulWidget {
  final List<PieChartModel> objects;
  const ChartPieChart({super.key, required this.objects});
  @override
  State<ChartPieChart> createState() => _ChartPieChartState();
}

class _ChartPieChartState extends State<ChartPieChart> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: showingSections(),
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  pieTouchResponse == null ||
                  pieTouchResponse.touchedSection == null) {
                touchedIndex = -1;
                return;
              }
              touchedIndex =
                  pieTouchResponse.touchedSection!.touchedSectionIndex;
            });
          },
        ),
        borderData: FlBorderData(
          show: false,
        ),
        sectionsSpace: 0,
        centerSpaceRadius: 30,
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    List obj = widget.objects;

    return List.generate(
      obj.length,
      (i) {
        final isTouched = i == touchedIndex;
        final fontSize = isTouched ? 20.0 : 12.0;
        final radius = isTouched ? 60.0 : 50.0;
        const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

        return PieChartSectionData(
          color: obj[i].color,
          value: obj[i].value,
          title: '${obj[i].label} ${(obj[i].value).round()}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: shadows,
          ),
        );
      },
    );
  }
}
