import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/firestore_service.dart';
// import '../data/tasks_data.dart';
import '../models/task_model.dart';
import '../widgets/navbars_widgets.dart';
import '../widgets/button_widget.dart';
import '../widgets/stacked_bar_widget.dart';


class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final state = ModalRoute.of(context)?.settings.arguments as String?;
    final firestore = context.read<FirestoreService>();

    return Scaffold(
      appBar: const AppBarTop(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  state == 'All'
                    ? 'Alle Tasks'
                    : 'Tasks ',
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
            Expanded(
              child: StreamBuilder<List<TaskModel>>(
                stream: firestore.getTasks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child:CircularProgressIndicator());
                  }
                  if (!snapshot.hasData) {
                    return const Center(child: Text('Keine Daten'));
                  }

                  final tasks = snapshot.data!;

                  final filteredTasks = (state == null || state == 'All')
                    ? tasks
                    : tasks.where((task) => task.state == state).toList();

                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: filteredTasks.length,
                          itemBuilder: (context, index) {
                            final task = filteredTasks[index];

                            return ListTile(
                              leading: const Icon(Icons.check_box_outline_blank),
                              title: Text(task.name),
                              subtitle: Text('Alle ${task.recurrence} Tage'),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15),
                      Text('Status wechseln:'),
                      StackedBar(tasks: tasks),
                      SizedBox(height: 25),
                    ],
                  );                  
                   
                },
              ),
            ),

            // Expanded(
            //   child: ListView(
            //     children: (state == 'All'
            //       ? tasks.values
            //       : tasks.values.where((task) => task.state == state))
            //     .map((task) {
            //       return ListTile(
            //         leading: const Icon(Icons.check_box_outline_blank),
            //         title: Text(task.name),
            //         subtitle: Text('Alle ${task.recurrence} Tage'),
            //       );
            //     }).toList(),
            //   ),
            // ),
            
            BasicButton(
              text: 'Home',
              // onPressed: () {
              //   Navigator.pop(context);
              // },
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/',
                );
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
