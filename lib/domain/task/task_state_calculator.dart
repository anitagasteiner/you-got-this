import '../../models/task_model.dart';
import '../../models/task_states.dart';


class TaskStateCalculator {
  static TaskStates calculate(TaskModel task) {
    int turningPointToDoSoon = task.recurrence ~/4;          // 1 -> TO DO SOON
    int turningPointStillFine = task.recurrence ~/4*2;       // 2 -> STILL FINE
    int turningPointDoneRecently = task.recurrence ~/4*3;   // 3 -> DONE RECENTLY
    final now = DateTime.now();
    final difference = task.dueDate.difference(now).inDays;
    if (difference <= 0) {
      return TaskStates.toDo;
    }
    if (difference <= turningPointToDoSoon) {
      return TaskStates.toDoSoon;
    }
    if (difference <= turningPointStillFine) {
      return TaskStates.stillFine;
    }
    if (difference <= turningPointDoneRecently) {
      return TaskStates.doneRecently;
    }
    else {
      return TaskStates.done;
    }
  }
}

