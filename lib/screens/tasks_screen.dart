import 'package:flutter/material.dart';
import '../widgets/navbars_widgets.dart';
import '../data/tasks_data.dart';
import '../widgets/button_widget.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final state = ModalRoute.of(context)?.settings.arguments;

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
                  state == 'All'
                    ? 'Alle Tasks'
                    : 'Tasks mit Status ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                if (state != 'All')
                  Text(
                    '$state',
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
                children: (state == 'All'
                  ? tasks.values
                  : tasks.values.where((task) => task.state == state))
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
            BasicButton(
              text: 'Home',
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icons.home_filled,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBarBottom(),
    );
    
  }

}
