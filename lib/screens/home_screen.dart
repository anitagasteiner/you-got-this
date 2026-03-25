import 'package:flutter/material.dart';
import '../common/colors.dart';
import '../calc.dart';
import '../widgets/navbars_widgets.dart';
// import '../widgets/color_box_link_widget.dart';
// import '../widgets/pie_chart_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/stacked_bar_widget.dart';


// int count = 0;


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
            SizedBox(height: 10),
            // Colored Bar:
            StackedBar(),
            // End of Colored Bar
            // Pie Chart:
            // OverviewPieChart(),
            // End of Pie Chart
            SizedBox(height: 24),
            SizedBox(
              width: 240,
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
                      'Tippe auf ein Feld und du kommst zu deinen Tasks.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            BasicButton(
              text: 'Alle Tasks',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/tasks',
                  arguments: 'All');
              },
              icon: Icons.assignment,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBarBottom(),
    );
  }
}
