import '../models/task_model.dart';

final Map<String, TaskModel> tasks = {
  'task1': TaskModel(name: 'Bettwäsche wechseln', recurrence: 14, category: 'toDo'),
  'task2': TaskModel(name: 'Handtücher wechseln', recurrence: 4, category: 'toDoSoon'),
  'task3': TaskModel(name: 'Zahnbürsten austauschen', recurrence: 60, category: 'stillFine'),
  'task4': TaskModel(name: 'Fenster putzen', recurrence: 365, category: 'doneRecently'),
  'task5': TaskModel(name: 'Wohnzimmer abstauben', recurrence: 14, category: 'done'),
};
