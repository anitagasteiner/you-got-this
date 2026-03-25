import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../common/colors.dart';


final categories = [
  'done',
  'doneRecently',
  'stillFine',
  'toDoSoon',
  'toDo',
];


class OverviewPieChart extends StatefulWidget {
  const OverviewPieChart({super.key,});

  @override
  State<StatefulWidget> createState() => PieChartState();
}

class PieChartState extends State<OverviewPieChart> {
  // int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
          // Pie Chart:
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                          // touchedIndex = -1;
                          return;
                        }
                      final index = pieTouchResponse
                        .touchedSection!
                        .touchedSectionIndex;
                      final category = categories[index];
                      handleSectionTap(context, category);
                      // touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 20,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          // End of Pie Chart
          //Caption:
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: ScaleColors.toDo,
                text: 'To Do',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: ScaleColors.toDoSoon,
                text: 'To Do Soon',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: ScaleColors.stillFine,
                text: 'Still Fine',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: ScaleColors.doneRecently,
                text: 'Done Recently',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: ScaleColors.done,
                text: 'Done',
                isSquare: true,
              )
            ],
          ),
          //End of Caption
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(5, (i) {
      // final isTouched = i == touchedIndex;
      // final fontSize = isTouched ? 25.0 : 16.0;
      final radius = 90.0;
      // final radius = isTouched ? 60.0 : 50.0;
      // const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      return switch (i) {
        0 => PieChartSectionData(
          color: ScaleColors.done,
          value: 30,
          title: 'Done',
          radius: radius,
          // double: 10,
          titleStyle: TextStyle(
            // fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: BaseColors.dark,
            // shadows: shadows,
          ),
        ),
        1 => PieChartSectionData(
          color: ScaleColors.doneRecently,
          value: 30,
          title: 'Done Recently',
          radius: radius,
          titleStyle: TextStyle(
            // fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: BaseColors.dark,
            // shadows: shadows,
          ),
        ),
        2 => PieChartSectionData(
          color: ScaleColors.stillFine,
          value: 15,
          title: 'Still Fine',
          radius: radius,
          titleStyle: TextStyle(
            // fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: BaseColors.dark,
            // shadows: shadows,
          ),
        ),
        3 => PieChartSectionData(
          color: ScaleColors.toDoSoon,
          value: 15,
          title: 'To Do Soon',
          radius: radius,
          titleStyle: TextStyle(
            // fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: BaseColors.dark,
            // shadows: shadows,
          ),
        ),
        4 => PieChartSectionData(
          color: ScaleColors.toDo,
          value: 10,
          title: 'To Do',
          radius: radius,
          titleStyle: TextStyle(
            // fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: BaseColors.dark,
            // shadows: shadows,
          ),
        ),
        _ => throw StateError('Invalid'),
      };
    });
  }

}


class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;

  const Indicator({
    super.key,
    required this.color,
    required this.text,
    this.isSquare = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}

void handleSectionTap(BuildContext context, String category) {
  Navigator.pushNamed(context, '/$category');
}