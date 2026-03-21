import 'data/tasks_data.dart';

String firstName = 'Anita';
String lastName = 'Gasteiner';

String fullName() {
  return '$firstName $lastName';
}

String greet() {
  return 'Hallo, $firstName!';
}

int calculate(int inputValue) {
  int result = inputValue * 2;
  return result;
}

int countByCategory(String category) {
  return tasks.values
    .where((task) => task.category == category)
    .length;
}
