import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../models/task_states.dart';
import '../calc.dart';

class ColorBoxLink extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  final List<TaskModel> tasks;
  final TaskStates state;

  const ColorBoxLink({
    super.key,
    required this.color,
    required this.onTap,
    required this.tasks,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: getWidth(tasks, state),
          height: 35,
        ),
      ),
    );
  }

}