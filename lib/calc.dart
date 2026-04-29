import './models/task_model.dart';
import './domain/task/task_state_calculator.dart';
import 'models/task_states.dart';

String firstName = 'Anita';
String lastName = 'Gasteiner';

// String fullName() {
//   return '$firstName $lastName';
// }

String greet() {
  return 'Hallo, $firstName!';
}

int countByState(List<TaskModel> tasks, TaskStates state) {
  return tasks.where((task) => TaskStateCalculator.calculate(task) == state).length;
}

double getWidth(List<TaskModel> tasks, TaskStates state) {
  int tasksAmount = tasks.length;
  if (tasksAmount == 0) {
    return 0;
  }
  return 250/tasksAmount*countByState(tasks, state);
}

double getValue(List<TaskModel> tasks, TaskStates state) {
  int tasksAmount = tasks.length;
  if (tasksAmount == 0) {
    return 0;
  }
  return 250/tasksAmount*countByState(tasks, state);
}

String getTextFromState(TaskStates taskState) {
  // Umwandlung in String:
  return taskState.name;
}

