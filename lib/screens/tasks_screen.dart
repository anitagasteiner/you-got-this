import 'package:flutter/material.dart';
import '../widgets/navbars_widgets.dart';
import '../data/tasks_data.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: const AppBarTop(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  category == 'All'
                    ? 'Alle Tasks'
                    : 'Tasks der Kategorie ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                if (category != 'All')
                  Text(
                    '$category',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                      color: Colors.green,
                    ),
                  ),
              ],              
            ),            
            SizedBox(height: 5),
            SizedBox(
              height: 200,
              child: ListView(
                children: (category == 'All'
                  ? tasks.values
                  : tasks.values.where((task) => task.category == category))
                .map((task) {
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
