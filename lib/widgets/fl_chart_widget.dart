import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../data/chart_categories_data.dart';
import '../common/colors.dart';
import '../models/task_model.dart';


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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
            borderData: FlBorderData(show: false),
            sectionsSpace: 0,
            centerSpaceRadius: 36,
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                if (event is! FlTapDownEvent) {
                  return;
                }
                if (pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                  return;
                }
                final index = pieTouchResponse.touchedSection!.touchedSectionIndex;
                // final categoryKey = chartCategories[index].key;
                final categoryLabel = chartCategories[index].label;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (!mounted) {
                    return;
                  }
                  Navigator.pushNamed(
                    context,
                    '/tasks',
                    // arguments: categoryKey
                    arguments: categoryLabel
                  );
                });
              },
            ),
            sections: _buildSections(widget.width),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildSections(double width) {
    final radius = width / 2.8;

    return List.generate(chartCategories.length, (i) {
      final categories = chartCategories[i];

      final count = widget.tasks
        .where((task) => task.state == categories.label.replaceAll('\n', ' '))
        .length;

      return PieChartSectionData(
        color: categories.color,
        value: count.toDouble(),
        title: categories.label,
        radius: radius,
        titlePositionPercentageOffset: 0.6,
        titleStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: BaseColors.dark,
        ),
      );
    });
  }
}

