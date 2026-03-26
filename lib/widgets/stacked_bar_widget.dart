import 'package:flutter/material.dart';
import 'color_box_link_widget.dart';
import '../common/colors.dart';


class StackedBar extends StatelessWidget {
  const StackedBar({super.key});

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
                arguments: 'Done',
              );
            },
            category: 'Done',
          ),
          ColorBoxLink(
            color: ScaleColors.doneRecently,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/tasks',
                arguments: 'Done Recently',
              );
            },
            category: 'Done Recently',
          ),
          ColorBoxLink(
            color: ScaleColors.stillFine,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/tasks',
                arguments: 'Still Fine',
              );
            },
            category: 'Still Fine',
          ),
          ColorBoxLink(
            color: ScaleColors.toDoSoon,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/tasks',
                arguments: 'To Do Soon',
              );
            },
            category: 'To Do Soon',
          ),
          ColorBoxLink(
            color: ScaleColors.toDo,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/tasks',
                arguments: 'To Do',
              );
            },
            category: 'To Do',
          ),
        ],
      );
    }

}


