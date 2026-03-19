import 'package:flutter/material.dart';
import '../common/colors.dart';
import '../calc.dart';
import '../widgets/navbars_widgets.dart';

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
            ElevatedButton(
              child: Text('Details'),
              onPressed: () {
                Navigator.pushNamed(context, '/tasks');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBarBottom(),
    );
  }
}