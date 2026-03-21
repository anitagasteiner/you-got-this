import 'data/tasks_data.dart';

String firstName = 'Anita';
String lastName = 'Gasteiner';

String fullName() {
  return '$firstName $lastName';
}

String greet() {
  return 'Hallo, $firstName!';
}

int countByCategory(String category) {
  return tasks.values
    .where((task) => task.category == category)
    .length;
}

double getWidth(String category) {
  int tasksAmount = tasks.values.length;
  return 250/tasksAmount*countByCategory(category);
}