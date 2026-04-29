import '../../models/task_model.dart';
import '../../models/task_states.dart';


class TaskStateCalculator {
  static TaskStates calculate(TaskModel task) {
    int turningPointDoneRecently = task.recurrence ~/ 4;
    int turningPointStillFine = task.recurrence ~/4*2;
    int turningPointToDoSoon = task.recurrence ~/4*3;
    int turningPointToDo = task.recurrence;
    final now = DateTime.now();
    final difference = task.dueDate.difference(now).inDays;

    if (difference < turningPointDoneRecently) {
    return TaskStates.done;
    }
    if (difference < turningPointStillFine) {
      return TaskStates.doneRecently;
    }
    if (difference < turningPointToDoSoon) {
      return TaskStates.stillFine;
    }
    if (difference < turningPointToDo) {
      return TaskStates.toDoSoon;
    }
    else {
      return TaskStates.toDo;
    }  

  }
}

