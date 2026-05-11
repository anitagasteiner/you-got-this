import 'package:flutter/material.dart';
import '../core/ui/app_bar_top_widget.dart';
import '../core/ui/app_bar_bottom_widget.dart';
import '../core/ui/button_widget.dart';
import '../core/ui/task_form_widget.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

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
                Text('Neuen Task hinzufügen',
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
              child: const TaskForm(),
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
