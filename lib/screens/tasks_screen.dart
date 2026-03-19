import 'package:flutter/material.dart';
import 'navbars.dart';
import '../data/tasks_data.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarTop(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 5),
            Text('Tasks der Kategorie XXX'),
            SizedBox(height: 5),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Die Test-Berechnung ergibt:'),
                SizedBox(width: 5),
                Text('ABC'),
              ],
            ),
            SizedBox(height: 25),
            ElevatedButton(
              child: Text('zurück'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBarBottom(),
    );
  }
}