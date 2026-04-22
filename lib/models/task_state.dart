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
        return 'Done';
      case TaskState.doneRecently:
        return 'Done Recently';
      case TaskState.stillFine:
        return 'Still Fine';
      case TaskState.toDoSoon:
        return 'To Do Soon';
      case TaskState.toDo:
        return 'To Do';
    }
  }
}
