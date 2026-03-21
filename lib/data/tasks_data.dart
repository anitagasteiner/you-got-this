import '../models/task_model.dart';

final Map<String, TaskModel> tasks = {
  'task1': TaskModel(name: 'Bettwäsche wechseln', recurrence: 14, category: 'To Do'),
  'task2': TaskModel(name: 'Handtücher wechseln', recurrence: 4, category: 'To Do Soon'),
  'task3': TaskModel(name: 'Zahnbürsten austauschen', recurrence: 60, category: 'Still Fine'),
  'task4': TaskModel(name: 'Fenster putzen', recurrence: 365, category: 'Done Recently'),
  'task5': TaskModel(name: 'Wohnzimmer abstauben', recurrence: 14, category: 'Done'),
  'task6': TaskModel(name: 'Waschmaschinen reinigen', recurrence: 60, category: 'Still Fine'),
};
