import 'package:flutter/material.dart';
import '../common/colors.dart';
import '../data/tasks.dart';
import '../calc.dart';
import 'navbars.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarTop(),
      body: Padding( // Center(child: LandingPage()),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 5), // für Abstand zwischen Elementen
            Text(greet()),
            SizedBox(height: 25),
            Text('Das ist die Task-Übersicht von ${fullName()}.'),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Die Berechnung ergibt:'),
                SizedBox(width: 5),
                Text(calculate(3).toString()),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [              
                ColoredBox(
                  color: ScaleColors.toDo,
                  child: SizedBox(
                    width: 50,
                    height: 35,
                  ),
                ),
                ColoredBox(
                  color: ScaleColors.toDoSoon,
                  child: SizedBox(
                    width: 50,
                    height: 35,
                  ),
                ),
                ColoredBox(
                  color: ScaleColors.stillFine,
                  child: SizedBox(
                    width: 50,
                    height: 35,
                  ),
                ),
                ColoredBox(
                  color: ScaleColors.doneRecently,
                  child: SizedBox(
                    width: 50,
                    height: 35,
                  ),
                ),
                ColoredBox(
                  color: ScaleColors.done,
                  child: SizedBox(
                    width: 50,
                    height: 35,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 200,
              child: ListView(
                children: tasks.values.map((task) {
                  return ListTile(
                    leading: const Icon(Icons.check_box_outline_blank),
                    title: Text(task.name),
                    subtitle: Text('Alle ${task.recurrence} Tage'),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBarBottom(),
    );
  }
}