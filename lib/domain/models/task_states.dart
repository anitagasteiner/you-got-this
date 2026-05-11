// Defines the status of a task as enum.
enum TaskStates {
  done,
  doneRecently,
  stillFine,
  toDoSoon,
  toDo,
}

// Expands the enum with additional logic.
// Gives back user friendly wording.
extension TaskStatesX on TaskStates {
  String get label {
    switch (this) {
      case TaskStates.done:
        return 'done'; // :)))
      case TaskStates.doneRecently:
        return 'just done'; // :))
      case TaskStates.stillFine:
        return 'all good'; // :)
      case TaskStates.toDoSoon:
        return 'upcoming'; // -_- next
      case TaskStates.toDo:
        return 'to do'; // 0_0 !_!
    }
  }
}
