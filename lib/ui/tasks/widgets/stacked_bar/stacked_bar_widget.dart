import 'package:flutter/material.dart';
import 'color_box_link_widget.dart';
import '../../../core/themes/colors.dart';
import '../../../../domain/models/task_model.dart';
import '../../../../domain/models/task_states.dart';


class StackedBar extends StatelessWidget {
  final List<TaskModel> tasks;

  const StackedBar({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [    
        Row(
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
        ),
        Positioned.fill(
          child: Center(
            child: IgnorePointer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.touch_app,
                    size: 26,
                    color: BaseColors.dark,
                    semanticLabel: '',
                  ),
                  
                    Text(
                      'Tasks nach Status anzeigen',
                      // textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  
                ],
              ),
              // child: Text(
              //   'Tasks nach Status anzeigen',
              //   style: TextStyle(color: BaseColors.dark),
              // ),
            ),
          ),
        ),
      ],
    );
  }

}

