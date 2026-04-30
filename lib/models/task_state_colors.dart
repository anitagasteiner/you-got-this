import 'package:flutter/material.dart';
import 'task_states.dart';
import '../common/colors.dart';


extension TaskStateColorsX on TaskStates {
  Color get color {
    switch (this) {
      case TaskStates.done:
        return ScaleColors.done;
      case TaskStates.doneRecently:
        return ScaleColors.doneRecently;
      case TaskStates.stillFine:
        return ScaleColors.stillFine;
      case TaskStates.toDoSoon:
        return ScaleColors.toDoSoon;
      case TaskStates.toDo:
        return ScaleColors.toDo;
    }
  }
}
