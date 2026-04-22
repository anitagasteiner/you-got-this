// Describes the structure of a task and how it is loaded from Firestore.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'task_state.dart';


class TaskModel {

  final String name;
  final DateTime dueDate;
  final int recurrence; // in Tagen
  final TaskState state;

  // Constructor
  TaskModel({
    required this.name,
    required this.dueDate,
    required this.recurrence,
    required this.state,
  });

  // Firestore Mapping
  factory TaskModel.fromFirestore(DocumentSnapshot doc) {

    // Converts a Firestore Document into a Dart Object. -> Raw data from Firestore are read as map.
    // - doc is a DocumentSnapshot from Firestore.
    // - doc.data() delivers the saved data of the document.
    // - The return value is dynamically typed.
    // - States that the Firestore data are a map of which the keys are strings and the values have random types.
    // - Result: data['name], data['dueDate'], data['state']. -> Therefore, it can be accessed like a JSON object.
    final data = doc.data() as Map<String, dynamic>;

    return TaskModel(
      name: data['name'] ?? '', // Fallback to empty string if field is missing.
      dueDate: (data['dueDate'] as Timestamp).toDate(), // Firestore Timestamp is converted into DateTime.
      recurrence: data['recurrence'] ?? 1, // Default: 1 day.
      state: TaskState.values.firstWhere( // String from Firestore is mapped to Enum. -> Enums are a special kind of class used to represent a fixed number of constant values.
      // - firstWhere searches in the list of TaskState values
      // - Example Result: "state: TaskState.toDoSoon"
        (e) => e.name == data['state'],
        orElse: () => TaskState.toDo, // Fallback
      ),
    );
  }

  // Gives back a map of which the keys are strings and the values are dynamic (random types). Firestore expects this format to save the data.
  // Converts the TaskModel Object into a Firestore compatible format: dart object -> Firestore JSON-like structure
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'dueDate': dueDate,
      'recurrence': recurrence,
      'state': state.name, // State is an enum; .name gives back the string name of the enum.
    };
  }
    
}
