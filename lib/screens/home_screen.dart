import 'package:flutter/material.dart';
import '../common/colors.dart';
import '../calc.dart';
import '../widgets/navbars_widgets.dart';
import '../widgets/color_box_link_widget.dart';

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
            Text(greet()),
            SizedBox(height: 25),
            Text('Das ist die Task-Übersicht von ${fullName()}.'),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Die Test-Berechnung ergibt:'),
                SizedBox(width: 5),
                Text(calculate(3).toString()),
              ],
            ),
            SizedBox(height: 5),
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
                  // category: 'toDo',
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
                  // category: 'toDoSoon',
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
                  // category: 'stillFine',
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
                  // category: 'doneRecently',
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
                  // category: 'done',
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              'Klicke einfach auf ein farbiges Feld und du gelangst zu den Tasks der entsprechenden Kategorie.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25),
            ElevatedButton(
              child: Text('Show all Tasks'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/tasks',
                  arguments: 'All');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBarBottom(),
    );
  }
}