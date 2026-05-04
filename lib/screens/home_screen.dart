// Main Dashboard:
// - Displays a greeting.
// - Shows a chart overview of all tasks depending on their status.
// - Provides navigation to all tasks and to creating a new task.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/firestore_service.dart';
import '../common/colors.dart';
import '../models/task_model.dart';
import '../calc.dart';
import '../widgets/navbars_widgets.dart';
import '../widgets/fl_chart_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/progress_circle_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarTop(),
      body: SingleChildScrollView(
        child: Padding(
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
              SizedBox(height: 16),
              StreamBuilder<List<TaskModel>>( // Subscribes to Firestore via a stream; rebuilds UI automatically when data changes.
                stream: context.read<FirestoreService>().getTasks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ProgressCircle(); // Loading Spinner
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text(
                      'Es sind noch keine Tasks vorhanden. Verwende den Button unten, um neue Tasks hinzuzufügen.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: BaseColors.main,
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  final tasks = snapshot.data!;
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth.clamp(310.0, 400.0);
                      return SizedBox(
                        width: width,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: PieChartOverview(
                            width: width,
                            tasks: tasks,
                          ),
                        ),
                      );
                    },
                  );
                }
              ),
              SizedBox(height: 16),
              SizedBox(
                width: 250,
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
                        'Tippe auf einen Status, und du gelangst zu diesen Tasks.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BasicButton(
                    text: 'Alle Tasks',
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/tasks',
                        arguments: null
                      );
                    },
                    icon: Icons.assignment,
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
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBarBottom(),
    );
  }
}
