// Data base operations

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';


class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance; // _db is an instance of the Firestore database; it is initialized just once (final); it's a private variable (_) -> can be viewed within the class only.

  // Load Tasks:
  // - Accesses the Firestore collection 'tasks'.
  // - .snapshots() gives back a stream -> not just single request, but live updates automatically.
  Stream<List<TaskModel>> getTasks() {
    return _db.collection('tasks').snapshots().map((snapshot) { // Transforms Firestore snapshot to dart list.
      return snapshot.docs // List of all documents in the collection.
        .map((doc) => TaskModel.fromFirestore(doc)) // Each Firestore document is converted to TaskModel.
        .toList();
    });
  }

  // Add Task:
  // - Generates a new document in 'tasks'.
  // - Firestore automatically generates an ID.
  Future<void> addTask(TaskModel task) {
    return _db.collection('tasks').add(task.toFirestore()); // mapping logic from TaskModel
  }

  // Delete Task:
  // - doc(task.id) picks a certain document using the ID.
  // - delete() deletes it.
  Future<void> deleteTask(TaskModel task) {
    return _db.collection('tasks').doc(task.id).delete();
  }

  // Update Task:
  // - Changes an existing document.
  // - Future: async operation.
  // - _db.collection('tasks') accesses the Firestore collection 'tasks'.
  // - .doc(task.id) picks a certain document using the ID.
  // - .update(task.toFirestore()) overwrites the specified fields; uses the map from toFirestore().
  // - try/catch: error handling.
  Future<void> updateTask(TaskModel task) async {
    try {
      await _db.collection('tasks').doc(task.id).update(task.toFirestore());
    } catch (e) {
      rethrow;
    }     
  }

}
