import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
// import '../data/chart_categories_data.dart';
import '../common/colors.dart';
import '../models/task_model.dart';
import '../models/task_state.dart';


class PieChartOverview extends StatefulWidget {
  final double width;
  final List<TaskModel> tasks;

  const PieChartOverview({
    super.key,
    required this.width,
    required this.tasks,
    });

  @override
  State<PieChartOverview> createState() => _PieChartOverviewState();
}

class _PieChartOverviewState extends State<PieChartOverview> {

  Color _colorForState(TaskState state) {
    switch (state) {
      case TaskState.done:
        return ScaleColors.done;
      case TaskState.doneRecently:
        return ScaleColors.doneRecently;
      case TaskState.stillFine:
        return ScaleColors.stillFine;
      case TaskState.toDoSoon:
        return ScaleColors.toDoSoon;
      case TaskState.toDo:
        return ScaleColors.toDo;
    }
  }

  @override
  Widget build(BuildContext context) {
    final states = TaskState.values;
    
    return Center(
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
            borderData: FlBorderData(show: false),
            sectionsSpace: 2, //6, //0,
            centerSpaceRadius: double.infinity,
            centerSpaceColor: BaseColors.light,
            startDegreeOffset: 300,
            //centerSpaceRadius: 18, //36,
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                if (event is! FlTapDownEvent) {
                  return;
                }
                if (pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                  return;
                }
                final index = pieTouchResponse.touchedSection!.touchedSectionIndex;
                final state = states[index];
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (!mounted) {
                    return;
                  }
                  Navigator.pushNamed(
                    context,
                    '/tasks',
                    arguments: state
                  );
                });
              },
            ),
            sections: _buildSections(states),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildSections(List<TaskState> states) {
    final radius = widget.width / 2.8;

    return states.map((state) {
      final count = widget.tasks
        .where((task) => task.state == state)
        .length;

      return PieChartSectionData(
        color: _colorForState(state),
        value: count.toDouble(),
        title: state.label,
        radius: radius,
        titlePositionPercentageOffset: 0.6,
        titleStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: BaseColors.dark,
        ),
        cornerRadius: 4,
      );
    }).toList();
  }

}
