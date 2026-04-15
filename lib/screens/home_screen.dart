import 'package:flutter/material.dart';
import '../common/colors.dart';
import '../calc.dart';
import '../widgets/navbars_widgets.dart';
import '../widgets/fl_chart_widget.dart';
import '../widgets/button_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarTop(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 5),
            Text(
              greet(),
              style: Theme.of(context).textTheme.titleLarge,
              ),
            SizedBox(height: 25),
            Text(
              'Das ist deine Task-Übersicht:',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
              ),
            SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth.clamp(300.0, 400.0);
                return SizedBox(
                  width: width,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: PieChartOverview(width: width),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 250,
              child: Row(
                children: [
                  Icon(
                    Icons.touch_app,
                    size: 30,
                    color: BaseColors.dark,
                    semanticLabel: '',
                  ),
                  Expanded(
                    child: Text(
                      'Tippe auf eine Kategorie, und du gelangst zu deren Tasks.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BasicButton(
                  text: 'Alle Tasks',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/tasks',
                      arguments: 'All'
                    );
                  },
                  icon: Icons.assignment,
                ),
                BasicButton(
                  text: 'Neuer Task',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/new',
                    );
                  },
                  icon: Icons.add_circle_rounded,
                ),
              ],
            ),
            
          ],
        ),
      ),
      bottomNavigationBar: const AppBarBottom(),
    );
  }
}
