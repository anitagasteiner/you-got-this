import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../common/colors.dart';


class OverviewPieChart extends StatefulWidget {
  const OverviewPieChart({super.key,});

  @override
  State<StatefulWidget> createState() => PieChartState();
}

class PieChartState extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                        touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                      });
                    }
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: ScaleColors.toDo,
                text: 'Anita 1',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: ScaleColors.toDoSoon,
                text: 'Anita 2',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: ScaleColors.stillFine,
                text: 'Anita 3',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: ScaleColors.doneRecently,
                text: 'Anita 4',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: ScaleColors.done,
                text: 'Anita 5',
                isSquare: true,
              )
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      return switch (i) {
        0 => PieChartSectionData(
          color: ScaleColors.done,
          value: 40,
          title: '40 %',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            shadows: shadows,
          ),
        ),
        1 => PieChartSectionData(
          color: ScaleColors.doneRecently,
          value: 30,
          title: '30%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            shadows: shadows,
          ),
        ),
        2 => PieChartSectionData(
          color: ScaleColors.stillFine,
          value: 15,
          title: '15%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            shadows: shadows,
          ),
        ),
        3 => PieChartSectionData(
          color: ScaleColors.toDo,
          value: 15,
          title: '15%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            shadows: shadows,
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