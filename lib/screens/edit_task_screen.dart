import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../widgets/navbars_widgets.dart';
import '../widgets/button_widget.dart';
import '../widgets/task_form_widget.dart';

class EditTaskScreen extends StatelessWidget {
  final TaskModel task;

  const EditTaskScreen({
    super.key,
    required this.task
  });

  @override
  Widget build(BuildContext context) {
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
                Text('Task bearbeiten',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            SizedBox(
              width: 250,
              child: TaskForm(task: task),
            ),
            SizedBox(height: 24),
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
          ],
        ),
      ),
      bottomNavigationBar: const AppBarBottom(),
    );
    
  }

}
