import 'package:flutter/material.dart';
import 'color_box_link_widget.dart';
import '../common/colors.dart';
import '../models/task_model.dart';
import '../models/task_states.dart';


class StackedBar extends StatelessWidget {
  final List<TaskModel> tasks;

  const StackedBar({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorBoxLink(
            color: ScaleColors.done,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/tasks',
                arguments: TaskStates.done,
              );
            },
            tasks: tasks,
            state: TaskStates.done,
          ),
          ColorBoxLink(
            color: ScaleColors.doneRecently,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/tasks',
                arguments: TaskStates.doneRecently,
              );
            },
            tasks: tasks,
            state: TaskStates.doneRecently,
          ),
          ColorBoxLink(
            color: ScaleColors.stillFine,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/tasks',
                arguments: TaskStates.stillFine,
              );
            },
            tasks: tasks,
            state: TaskStates.stillFine,
          ),
          ColorBoxLink(
            color: ScaleColors.toDoSoon,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/tasks',
                arguments: TaskStates.toDoSoon,
              );
            },
            tasks: tasks,
            state: TaskStates.toDoSoon,
          ),
          ColorBoxLink(
            color: ScaleColors.toDo,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/tasks',
                arguments: TaskStates.toDo,
              );
            },
            tasks: tasks,
            state: TaskStates.toDo,
          ),
        ],
      );
    }

}


