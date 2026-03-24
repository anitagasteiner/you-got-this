import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../common/colors.dart';


class OverviewPieChartSection extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  final String category;

  const OverviewPieChartSection({
    super.key,
    required this.color,
    required this.onTap,
    required this.category,
  });

PieChartSectionData buildSection() {
  return PieChartSectionData(
    value: 30,
    color: color,
    title: category,
    radius: 110,
    titleStyle: const TextStyle(
      // color: Colors.white,
      fontSize: 14,
      // fontWeight: FontWeight.bold,
    ),
    titlePositionPercentageOffset: 0.7,
  );
}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 0,
          sectionsSpace: 0,
          sections: [
            PieChartSectionData(
              value: 30,
              color: ScaleColors.toDo,
              title: 'To Do',
              radius: 110,
              titleStyle: const TextStyle(
                // color: Colors.white,
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              titlePositionPercentageOffset: 0.7,
            ),
            PieChartSectionData(
              value: 30,
              color: ScaleColors.toDoSoon,
              title: 'To Do \n Soon',
              radius: 110,
              titleStyle: const TextStyle(
                // color: Colors.white,
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              titlePositionPercentageOffset: 0.7,
            ),
            PieChartSectionData(
              value: 20,
              color: ScaleColors.stillFine,
              title: 'Still \n Fine',
              radius: 110,
              titleStyle: const TextStyle(
                // color: Colors.black,
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              titlePositionPercentageOffset: 0.7,
            ),
            PieChartSectionData(
              value: 10,
              color: ScaleColors.doneRecently,
              title: 'Done \n Recently',
              radius: 110,
              titleStyle: const TextStyle(
                // color: Colors.black,
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              titlePositionPercentageOffset: 0.7,
            ),
            PieChartSectionData(
              value: 10,
              color: ScaleColors.done,
              title: 'Done',
              radius: 110,
              titleStyle: const TextStyle(
                // color: Colors.white,
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              titlePositionPercentageOffset: 0.7,
            ),
          ],
        ),
      ),
    );
  }

}

