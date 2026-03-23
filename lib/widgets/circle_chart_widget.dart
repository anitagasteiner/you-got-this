import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../common/colors.dart';


// class ScaleColors {
//   static final toDo = Colors.red[400]!;
//   static final toDoSoon = Colors.orange[400]!;
//   static final stillFine = Colors.yellow[400]!;
//   static final doneRecently = Colors.lightGreen[400]!;
//   static final done = Colors.green[400]!;
// }


class SimplePieChart extends StatelessWidget {
  const SimplePieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      // width: 500,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 0,
          sectionsSpace: 0,
          sections: [
            PieChartSectionData(
              value: 30,
              color: ScaleColors.toDo,
              title: 'To Do',
              radius: 90,
              titleStyle: const TextStyle(
                // color: Colors.white,
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              titlePositionPercentageOffset: 0.8,
            ),
            PieChartSectionData(
              value: 30,
              color: ScaleColors.toDoSoon,
              title: 'To Do \n Soon',
              radius: 90,
              titleStyle: const TextStyle(
                // color: Colors.white,
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              titlePositionPercentageOffset: 0.8,
            ),
            PieChartSectionData(
              value: 20,
              color: ScaleColors.stillFine,
              title: 'Still \n Fine',
              radius: 90,
              titleStyle: const TextStyle(
                // color: Colors.black,
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              titlePositionPercentageOffset: 0.8,
            ),
            PieChartSectionData(
              value: 10,
              color: ScaleColors.doneRecently,
              title: 'Done \n Recently',
              radius: 90,
              titleStyle: const TextStyle(
                // color: Colors.black,
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              titlePositionPercentageOffset: 0.8,
            ),
            PieChartSectionData(
              value: 10,
              color: ScaleColors.done,
              title: 'Done',
              radius: 90,
              titleStyle: const TextStyle(
                // color: Colors.white,
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              titlePositionPercentageOffset: 0.8,
            ),
          ],
        ),
      ),
    );
  }

}