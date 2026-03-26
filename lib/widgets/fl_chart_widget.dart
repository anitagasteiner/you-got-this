import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../data/chart_categories_data.dart';
import '../common/colors.dart';


class PieChartOverview extends StatefulWidget {
  const PieChartOverview({super.key});

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
            centerSpaceRadius: 0,
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
            sections: _buildSections(),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildSections() {
    return List.generate(chartCategories.length, (i) {
      final c = chartCategories[i];
      return PieChartSectionData(
        color: c.color,
        value: c.value,
        title: c.label,
        radius: MediaQuery.of(context).size.width / 2.3,
        titleStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: BaseColors.dark,
        ),
      );
    });
  }
}

