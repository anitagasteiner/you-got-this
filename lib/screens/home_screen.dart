import 'package:flutter/material.dart';
import '../common/colors.dart';
import '../calc.dart';
import '../widgets/navbars_widgets.dart';
import '../widgets/color_box_link_widget.dart';
import '../widgets/pie_chart_widget.dart';
import '../widgets/button_widget.dart';


int count = 0;


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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorBoxLink(
                  color: ScaleColors.toDo,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/tasks',
                      arguments: 'To Do',
                    );
                  },
                  category: 'To Do',
                ),
                ColorBoxLink(
                  color: ScaleColors.toDoSoon,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/tasks',
                      arguments: 'To Do Soon',
                    );
                  },
                  category: 'To Do Soon',
                ),
                ColorBoxLink(
                  color: ScaleColors.stillFine,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/tasks',
                      arguments: 'Still Fine',
                    );
                  },
                  category: 'Still Fine',
                ),
                ColorBoxLink(
                  color: ScaleColors.doneRecently,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/tasks',
                      arguments: 'Done Recently',
                    );
                  },
                  category: 'Done Recently',
                ),
                ColorBoxLink(
                  color: ScaleColors.done,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/tasks',
                      arguments: 'Done',
                    );
                  },
                  category: 'Done',
                ),
              ],
            ),
            SizedBox(height: 20),
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
            OverviewPieChart(),
          ],
        ),
      ),
      bottomNavigationBar: const AppBarBottom(),
    );
  }
}
