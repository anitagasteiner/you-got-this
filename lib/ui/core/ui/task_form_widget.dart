import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../data/services/firestore_service.dart';
import '../../../domain/models/task_model.dart';
import '../../../common/colors.dart';
import 'button_widget.dart';


class TaskForm extends StatefulWidget {
  final TaskModel? task;

  const TaskForm({
    super.key,
    this.task
  });

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final taskName = TextEditingController();
  final taskRecurrence = TextEditingController();
  DateTime? selectedDate;
  //TaskState? _selectedState = TaskState.toDo;

  void _resetForm() {
    _formKey.currentState!.reset();
    taskName.clear();
    taskRecurrence.clear();

    setState(() {
      selectedDate = null;
      //_selectedState = TaskState.toDo;
    });
  }

  @override
  void initState() {
    super.initState();
    taskName.text = widget.task?.name ?? '';
    taskRecurrence.text = widget.task?.recurrence.toString() ?? '';
    selectedDate = widget.task?.dueDate;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    taskName.dispose();
    taskRecurrence.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final firestore = context.read<FirestoreService>();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(hintText: 'Bezeichnung'),
            validator: (String? value) {
              if (value == null || value.isEmpty || RegExp(r'[^\p{L}\p{M}\p{N} ]', unicode: true).hasMatch(value)) { // RegExp(r'[^a-zA-Z0-9 ]')
                return 'Gib die Bezeichnung des Tasks ein.';
              }
              return null;
            },
            controller: taskName,
          ),
          SizedBox(height: 12),
          DateTimeFormField(
            mode: DateTimeFieldPickerMode.date,
            initialValue: selectedDate,
            dateFormat: DateFormat('dd.MM.yyyy', 'de'),
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: const InputDecoration(hintText: 'Fälligkeitsdatum'),
            firstDate: DateTime.now(), // prevents date in the past
            initialPickerDateTime: selectedDate ?? DateTime.now(),
            // firstDate: DateTime.now().add(const Duration(days: 10)),
            // lastDate: DateTime.now().add(const Duration(days: 40)),
            // initialPickerDateTime: DateTime.now().add(const Duration(days: 7)),
            onChanged: (DateTime? value) {
              setState(() {
                selectedDate = value;
              });              
            },
            validator: (DateTime? value) {
              if (value == null) {
                return 'Wähle ein erstes Fälligkeitsdatum.';
              }
              final now = DateTime.now();
              final today = DateTime(now.year, now.month, now.day);
              final selected = DateTime(value.year, value.month, value.day);
              if (selected.isBefore(today)) {
                return 'Das erste Fälligkeitsdatum darf nicht in der Vergangenheit liegen.';
              }
              return null;
            },
          ),
          SizedBox(height: 12),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Wiederholung in Tagen'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty || RegExp(r'\D').hasMatch(value)) {
                return 'Gib die Wiederholung in Tagen ein.';
              }
              return null;
            },
            controller: taskRecurrence,
          ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BasicButton(
                text: 'Leeren',
                onPressed: _resetForm,
                icon: Icons.remove_circle_rounded,
              ),
              BasicButton(
                text: 'OK',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (selectedDate == null) {
                      return;
                    }

                    final recurrence = int.parse(taskRecurrence.text);

                    final taskData = TaskModel(
                      id: widget.task?.id ?? '',
                      name: taskName.text,
                      dueDate: selectedDate!,
                      recurrence: recurrence,
                    );

                    if (widget.task == null) {
                      await firestore.addTask(taskData);
                    } else {
                      await firestore.updateTask(taskData);
                    }

                    if (!context.mounted) return;

                    _resetForm();
                   
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: const Text(
                            'Deine Eingaben wurden gespeichert.'
                          ),
                          contentPadding: EdgeInsets.all(18.0),
                          backgroundColor: BaseColors.light,
                        );
                      },
                    );                    
                  }
                },
                icon: Icons.check_circle_rounded,
              ),
            ],
          ),
        ],
      ),
    );
  }

}