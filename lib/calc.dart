import './models/task_model.dart';
import './models/task_state.dart';

String firstName = 'Anita';
String lastName = 'Gasteiner';

// String fullName() {
//   return '$firstName $lastName';
// }

String greet() {
  return 'Hallo, $firstName!';
}

int countByState(List<TaskModel> tasks, String state) {
  return tasks.where((task) => task.state == state).length;
}

double getWidth(List<TaskModel> tasks, String state) {
  int tasksAmount = tasks.length;
  return 250/tasksAmount*countByState(tasks, state);
}

double getValue(List<TaskModel> tasks, String state) {
  int tasksAmount = tasks.length;
  return 250/tasksAmount*countByState(tasks, state);
}

TaskState getStatus(DateTime dueDate, int recurrence) {
  int turningPointDoneRecently = recurrence ~/ 4;
  int turningPointStillFine = recurrence ~/4*2;
  int turningPointToDoSoon = recurrence ~/4*3;
  int turningPointToDo = recurrence;
  final today = removeTime(DateTime.now());
  final due = removeTime(dueDate);
  final difference = due.difference(today).inDays;
  if (difference < turningPointDoneRecently) {
    return TaskState.done;
  }
  if (difference < turningPointStillFine) {
    return TaskState.doneRecently;
  }
  if (difference < turningPointToDoSoon) {
    return TaskState.stillFine;
  }
  if (difference < turningPointToDo) {
    return TaskState.toDoSoon;
  }
  else {
    return TaskState.toDo;
  }
  
}

DateTime removeTime(DateTime d) => DateTime(d.year, d.month, d.day);
