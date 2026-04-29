// Displays a list of tasks, optionally filtered by their state. Includes:
// - Dynamic title based on the selected state.
// - Scrollable task list.
// - Bar chart to change the displayed tasks depending on their state.
// - Navigation back to home screen.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/firestore_service.dart';
import '../common/colors.dart';
import '../domain/task/task_state_calculator.dart';
import '../domain/task/task_service.dart';
import '../models/task_model.dart';
import '../models/task_states.dart';
import '../widgets/navbars_widgets.dart';
import '../widgets/button_widget.dart';
import '../widgets/stacked_bar_widget.dart';


class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final state = ModalRoute.of(context)?.settings.arguments as TaskStates?; // Retrieves the argument passed via navigation.
    final firestore = context.read<FirestoreService>(); // Gets the Firestore service from the Provider. Used to fetch tasks.
    final taskService = context.read<TaskService>();

    return Scaffold(
      appBar: const AppBarTop(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 5),
            // Dynamic title:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state == null
                    ? 'Alle Tasks'
                    : 'Tasks ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                if (state != null)
                  Text(
                    state.label,
                    // getTextFromState(state),
                    // '$state',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                      color: Colors.green,
                    ),
                  ),
              ],
            ),
            // Main Content with StreamBuilder:
            // - Listens to real-time Firestore updates.
            // - Rebuilds UI when data changes.
            Expanded(
              child: StreamBuilder<List<TaskModel>>(
                stream: firestore.getTasks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator( // Loading Spinner
                        valueColor: AlwaysStoppedAnimation(BaseColors.main),
                        backgroundColor: BaseColors.accent,
                        strokeWidth: 12,
                        strokeCap: StrokeCap.round,
                      )
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Center(child: Text('Keine Tasks vorhanden.'));
                  }

                  final tasks = snapshot.data!; // Tasks list processing

                  if (tasks.isEmpty) {
                    return const Center(child: Text('Keine Tasks vorhanden.'));
                  }

                  // If no filter -> show all tasks, otherwise -> filter by state:
                  final filteredTasks = (state == null)
                    ? tasks
                    : tasks.where((task) => TaskStateCalculator.calculate(task) == state).toList();

                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: filteredTasks.length,
                          itemBuilder: (context, index) {
                            final task = filteredTasks[index];
                            final isDone = TaskStateCalculator.calculate(task) == TaskStates.done;

                            return ListTile(
                              leading: Checkbox(
                                value: isDone,
                                onChanged: (_) async {
                                  if (!isDone) {
                                    await taskService.completeTask(task);
                                  }                                  
                                },
                              ),
                              // leading: const Icon(Icons.check_box_outline_blank),
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
