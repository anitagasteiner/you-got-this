import 'data/tasks_data.dart';

String firstName = 'Anita';
String lastName = 'Gasteiner';

// String fullName() {
//   return '$firstName $lastName';
// }

String greet() {
  return 'Hallo, $firstName!';
}

int countByState(String state) {
  return tasks.values
    .where((task) => task.state == state)
    .length;
}

double getWidth(String state) {
  int tasksAmount = tasks.values.length;
  return 250/tasksAmount*countByState(state);
}

double getValue(String state) {
  int tasksAmount = tasks.values.length;
  return 250/tasksAmount*countByState(state);
}