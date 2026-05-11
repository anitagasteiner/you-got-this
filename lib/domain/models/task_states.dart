// Defines the status of a task as enum.
enum TaskStates {
  toDo,
  toDoSoon,
  stillFine,
  doneRecently,
  done,
}

// Expands the enum with additional logic.
// Gives back user friendly wording.
extension TaskStatesX on TaskStates {
  String get label {
    switch (this) {
      case TaskStates.toDo:
        return 'to do'; // 0_0 !_!
      case TaskStates.toDoSoon:
        return 'upcoming'; // -_- next
      case TaskStates.stillFine:
        return 'all good'; // :)
      case TaskStates.doneRecently:
        return 'just done'; // :))
      case TaskStates.done:
        return 'done'; // :)))
    }
  }
}
