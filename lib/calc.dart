import './models/task_model.dart';

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