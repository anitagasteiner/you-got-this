import 'package:flutter/material.dart';
import '../widgets/navbars_widgets.dart';
import '../widgets/button_widget.dart';
import '../widgets/new_task_form_widget.dart';

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
              child: const NewTaskForm(),
            ),
            SizedBox(height: 24),
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
