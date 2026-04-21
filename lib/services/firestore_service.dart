import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Load Tasks
  Stream<QuerySnapshot> getTasks() {
    return _db.collection('tasks').snapshots();
  }

  // Add Task
  Future<void> addTask(String name, DateTime dueDate, int recurrence, String state) {
    return _db.collection('tasks').add({
      'name': name,
      'dueDate': dueDate,
      'recurrence': recurrence,
      'state': state,
    });
  }

  // Delete Task
  Future<void> deleteTask(String id) {
    return _db.collection('tasks').doc(id).delete();
  }

}
