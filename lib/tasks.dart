final Map<String, Task> tasks = {
  'task1': Task(name: 'Bettwäsche wechseln', recurrence: 14),
  'task2': Task(name: 'Handtücher wechseln', recurrence: 4),
};

class Task {
  final String name;
  final int recurrence; // in Tagen

  Task({required this.name, required this.recurrence});
}