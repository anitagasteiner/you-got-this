import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../calc.dart';

class ColorBoxLink extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  final String category;
  final List<TaskModel> tasks;

  const ColorBoxLink({
    super.key,
    required this.color,
    required this.onTap,
    required this.category,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: getWidth(tasks, category),
          height: 35,
        ),
      ),
    );
  }

}