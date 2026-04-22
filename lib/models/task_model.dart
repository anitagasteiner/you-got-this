import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String name;
  final DateTime dueDate;
  final int recurrence; // in Tagen
  final String state;

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
        state: data['state'] ?? '',
      );
    }
    
}
