import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../common/colors.dart';


class PieChartOverview extends StatefulWidget {
  const PieChartOverview({super.key});

  @override
  State<PieChartOverview> createState() => PieChartOverviewState();
}


class PieChartOverviewState extends State<PieChartOverview> {

  Map<String, double> dataMap = {
    'Done': 30,
    'Done Recently': 15,
    'Still Fine': 15,
    'To Do Soon': 30,
    'To Do': 10,
  };


  final colorList = [
    ScaleColors.done,
    ScaleColors.doneRecently,
    ScaleColors.stillFine,
    ScaleColors.toDoSoon,
    ScaleColors.toDo,
  ];


  @override
  Widget build(BuildContext context) {
    return Center(
      child: PieChart(
        dataMap: dataMap,
        colorList: colorList,
        chartType: ChartType.disc,
        chartRadius: MediaQuery.of(context).size.width / 1.1,
        // ringStrokeWidth: 24,
        chartValuesOptions: const ChartValuesOptions(
          showChartValues: false,
          // showChartValuesInPercentage: true,
          // decimalPlaces: 0,
          // showChartValuesOutside: true,
          // showChartValueBackground: false,
        ),
        legendOptions: const LegendOptions(
          showLegends: true,
          legendShape: BoxShape.circle,
          legendTextStyle: TextStyle(fontSize: 14),
          legendPosition: LegendPosition.bottom,
          showLegendsInRow: true,
        ),
      ),
    );
  }

}
