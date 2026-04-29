import '../../models/task_model.dart';
import '../../services/firestore_service.dart';

class TaskService {
  final FirestoreService firestore;

  TaskService(this.firestore);

  // Mark task as done. -> Calculation: new dueDate = date today + recurrence
  Future<void> completeTask(TaskModel task) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final newDueDate = today.add(Duration(days: task.recurrence));
    final updatedTask = task.copyWith(
      dueDate: newDueDate,
    );
    await firestore.updateTask(updatedTask);
  }
  
}