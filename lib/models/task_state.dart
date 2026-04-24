// Defines the status of a task as enum.
enum TaskState {
  done,
  doneRecently,
  stillFine,
  toDoSoon,
  toDo,
}

// Expands the enum with additional logic.
// Gives back user friendly wording.
extension TaskStateX on TaskState {
  String get label {
    switch (this) {
      case TaskState.done:
        return 'done :)))';
      case TaskState.doneRecently:
        return 'just done :))';
      case TaskState.stillFine:
        return 'all good :)';
      case TaskState.toDoSoon:
        return 'next -_-';
      case TaskState.toDo:
        return 'to do !_!'; //0_0';
    }
  }
}
