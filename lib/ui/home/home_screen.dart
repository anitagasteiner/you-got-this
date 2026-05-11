// Main Dashboard:
// - Displays a greeting.
// - Shows a chart overview of all tasks depending on their status.
// - Provides navigation to all tasks and to creating a new task.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/services/firestore_service.dart';
import '../core/themes/colors.dart';
import '../../domain/models/task_model.dart';
import '../../calc.dart';
import '../core/ui/app_bar_top/app_bar_top_widget.dart';
import '../core/ui/app_bar_bottom_widget.dart';
import 'widgets/fl_chart_widget.dart';
import '../core/ui/button_widget.dart';
import '../core/ui/progress_circle_widget.dart';
import 'home_viewmodel.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(
        firestoreService: context.read<FirestoreService>(),
      ),
      child: const _HomeViewBody(),
    );
  }
}

class _HomeViewBody extends StatelessWidget {
  const _HomeViewBody();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>(); // Das ist korrekt, weil mein ViewModel aktuell keine notifyListeners() verwendet. Falls später State hinzukommt:
    // - read -> kein Rebuild
    // - watch -> Rebuild bei Änderungen

    return Scaffold(
      appBar: const AppBarTop(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 5),

              Text(
                greet(),
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(height: 25),

              Text(
                'Das ist deine Task-Übersicht:',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              StreamBuilder<List<TaskModel>>(
                stream: viewModel.tasksStream,
                builder: (context, snapshot) {

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ProgressCircle(); // Loading Spinner
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
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

              const SizedBox(height: 16),

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

              const SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BasicButton(
                    text: 'Alle Tasks',
                    icon: Icons.assignment,
                    onPressed: () {
                      viewModel.openAllTasks(context);
                    },
                  ),

                  BasicButton(
                    text: 'Neuer Task',
                    icon: Icons.add_circle_rounded,
                    onPressed: () {
                      viewModel.openNewTask(context);
                    },
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
