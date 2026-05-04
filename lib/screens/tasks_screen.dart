// Displays a list of tasks, optionally filtered by their state. Includes:
// - Dynamic title based on the selected state.
// - Scrollable task list.
// - Bar chart to change the displayed tasks depending on their state.
// - Navigation back to home screen.

import 'package:auto_hyphenating_text/auto_hyphenating_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:you_got_this/common/colors.dart';
import '../services/firestore_service.dart';
import '../domain/task/task_state_calculator.dart';
import '../domain/task/task_service.dart';
import '../models/task_model.dart';
import '../models/task_states.dart';
import '../models/task_state_colors.dart';
import '../widgets/navbars_widgets.dart';
import '../widgets/button_widget.dart';
import '../widgets/stacked_bar_widget.dart';
import '../widgets/progress_circle_widget.dart';


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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      state == null
                        ? 'Alle Tasks'
                        : 'Tasks ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
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
                          color: state.color, // Colors.green,
                        ),
                      ),
                  ]
                ),
                if (state != null)
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/tasks',
                              arguments: null
                            );
                          },
                          child: Icon(
                            Icons.circle,
                            color: BtnColors.back,
                            size: 40,
                          ),
                        ),
                      ),                      
                      Positioned.fill(
                        child: Center(
                          child: IgnorePointer(
                            child: Text(
                              'Alle',
                              style: TextStyle(color: BtnColors.front),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                      child: ProgressCircle() // Loading Spinner
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
                            final state = TaskStateCalculator.calculate(task);
                            final isDone = state == TaskStates.done;

                            return ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/edit',
                                  arguments: task,
                                );
                              },
                              leading: Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact,
                                  activeColor: ScaleColors.done,
                                  value: isDone,
                                  onChanged: (_) async {
                                    if (!isDone) {
                                      await taskService.completeTask(task);
                                    }                                  
                                  },
                                ),
                              ),
                              title: AutoHyphenatingText(
                                task.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.timeline_rounded,
                                        size: 18,
                                        color: state.color,
                                        semanticLabel: '',
                                      ),
                                      Expanded(
                                        child: Text(
                                          ' alle ${task.recurrence} Tage',
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.timer_outlined,
                                        size: 18,
                                        color: state.color,
                                        semanticLabel: '',
                                      ),
                                      Expanded(
                                        child: Text(
                                          ' ${DateFormat('d. MMM yyyy', 'de_DE').format(task.dueDate)}',
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete_outline),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                visualDensity: VisualDensity.compact,               
                                onPressed: () => _confirmDelete(context, task, taskService),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15),
                      StackedBar(tasks: tasks),
                      SizedBox(height: 25),
                    ],
                  );
                   
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BasicButton(
                  text: 'Home',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/',
                    );
                  },
                  icon: Icons.home_filled,
                ),
                BasicButton(
                  text: 'Neuer Task',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/new',
                    );
                  },
                  icon: Icons.add_circle_rounded,
                ),
              ]
            ),            
          ],
        ),
      ),
      bottomNavigationBar: const AppBarBottom(),
    );
    
  }

  Future<void> _confirmDelete(
    BuildContext context,
    TaskModel task,
    TaskService taskService,
  ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Möchtest du den Task wirklich löschen?'),
        content: const Text('Dieser Task wird dauerhaft gelöscht.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Abbrechen'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Löschen'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await taskService.deleteTask(task);
    }
  }

}
