import 'package:flutter/material.dart';
import '../../../data/services/firestore_service.dart';
import '../../../domain/models/task_model.dart';

class HomeViewModel extends ChangeNotifier {
  final FirestoreService firestoreService;

  HomeViewModel( {
    required this.firestoreService,
  });

  Stream<List<TaskModel>> get tasksStream {
    return firestoreService.getTasks();
  }

  void openAllTasks(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/tasks',
      arguments: null,
    );
  }

  void openNewTask(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/new',
    );
  }  
}
