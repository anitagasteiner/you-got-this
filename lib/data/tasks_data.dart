import '../models/task_model.dart';

final Map<String, TaskModel> tasks = {
  'task1': TaskModel(name: 'Bettwäsche wechseln', recurrence: 14, category: 'Done'),
  'task2': TaskModel(name: 'Handtücher wechseln', recurrence: 4, category: 'Done'),
  'task3': TaskModel(name: 'Zahnbürsten austauschen', recurrence: 60, category: 'To Do Soon'),
  'task4': TaskModel(name: 'Fenster putzen', recurrence: 365, category: 'Done Recently'),
  'task5': TaskModel(name: 'Küche oben abstauben', recurrence: 60, category: 'Still Fine'),
  'task6': TaskModel(name: 'Waschmaschinen reinigen', recurrence: 60, category: 'Still Fine'),
  'task7': TaskModel(name: 'Geschirrspüler reinigen', recurrence: 60, category: 'Done'),
  'task8': TaskModel(name: 'Sanitärteppiche waschen', recurrence: 14, category: 'To Do'),
  'task9': TaskModel(name: 'Wasserkocher entkalken', recurrence: 60, category: 'To Do Soon'),
  'task10': TaskModel(name: 'Vorhänge waschen', recurrence: 365, category: 'Done Recently'),
  'task11': TaskModel(name: 'Badezimmer oben abstauben', recurrence: 60, category: 'Done'),
  'task12': TaskModel(name: 'Vorzimmerteppiche waschen', recurrence: 30, category: 'Still Fine'),
};
