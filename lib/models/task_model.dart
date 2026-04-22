import 'package:cloud_firestore/cloud_firestore.dart';
import 'task_state.dart';

class TaskModel {
  final String name;
  final DateTime dueDate;
  final int recurrence; // in Tagen
  final TaskState state;

  TaskModel({
    required this.name,
    required this.dueDate,
    required this.recurrence,
    required this.state,
    });

    factory TaskModel.fromFirestore(DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;

      return TaskModel(
        name: data['name'] ?? '',
        dueDate: (data['dueDate'] as Timestamp).toDate(),
        recurrence: data['recurrence'] ?? 0,
        state: TaskState.values.firstWhere(
          (e) => e.name == data['state'],
        ),
      );
    }
    
}
