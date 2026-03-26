import '../models/task_model.dart';

final Map<String, TaskModel> tasks = {
  'task1': TaskModel(name: 'Bettwäsche wechseln', recurrence: 14, state: 'Done'),
  'task2': TaskModel(name: 'Handtücher wechseln', recurrence: 4, state: 'Done'),
  'task3': TaskModel(name: 'Zahnbürsten austauschen', recurrence: 60, state: 'To Do Soon'),
  'task4': TaskModel(name: 'Fenster putzen', recurrence: 365, state: 'Done Recently'),
  'task5': TaskModel(name: 'Küche oben abstauben', recurrence: 60, state: 'Still Fine'),
  'task6': TaskModel(name: 'Waschmaschinen reinigen', recurrence: 60, state: 'Still Fine'),
  'task7': TaskModel(name: 'Geschirrspüler reinigen', recurrence: 60, state: 'Done'),
  'task8': TaskModel(name: 'Sanitärteppiche waschen', recurrence: 14, state: 'To Do'),
  'task9': TaskModel(name: 'Wasserkocher entkalken', recurrence: 60, state: 'To Do Soon'),
  'task10': TaskModel(name: 'Vorhänge waschen', recurrence: 365, state: 'Done Recently'),
  'task11': TaskModel(name: 'Badezimmer oben abstauben', recurrence: 60, state: 'Done'),
  'task12': TaskModel(name: 'Vorzimmerteppiche waschen', recurrence: 30, state: 'Still Fine'),
};
