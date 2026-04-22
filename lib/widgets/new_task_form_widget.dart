import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../services/firestore_service.dart';
// import '../common/colors.dart';
import '../models/task_model.dart';
import 'button_widget.dart';


class NewTaskForm extends StatefulWidget {
  const NewTaskForm({super.key});

  @override
  State<NewTaskForm> createState() => _NewTaskFormState();
}

class _NewTaskFormState extends State<NewTaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final taskName = TextEditingController();
  final taskRecurrence = TextEditingController();
  DateTime? selectedDate;
  String? _selectedState = 'To Do';  
  List<String> statesList = ['Done', 'Done Recently', 'Still Fine', 'To Do Soon', 'To Do'];

  void _resetForm() {
    _formKey.currentState!.reset();
    taskName.clear();
    taskRecurrence.clear();

    setState(() {
      selectedDate = null;
      _selectedState = 'To Do';
    });
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
            dateFormat: DateFormat('dd.MM.yyyy', 'de'),
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: const InputDecoration(hintText: 'Fälligkeitsdatum'),
            // firstDate: DateTime.now().add(const Duration(days: 10)),
            // lastDate: DateTime.now().add(const Duration(days: 40)),
            initialPickerDateTime: DateTime.now().add(const Duration(days: 20)),
            onChanged: (DateTime? value) {
              setState(() {
                selectedDate = value;
              });              
            },
            validator: (DateTime? value) {
              if (value == null) {
                return 'Wähle ein erstes Fälligkeitsdatum.';
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
          SizedBox(height: 28),
          DropdownButtonFormField<String>(
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              labelText: 'Status',
              border: OutlineInputBorder(),
            ),
            initialValue: 'To Do',
            items: statesList
              .map((option) => DropdownMenuItem(
                value: option,
                child: Text(option),
              ))
              .toList(),
            onChanged: (value) {
              setState(() {
                _selectedState = value;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Bitte wähle einen Status.';
              }
              return null;
            },
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
                    if (selectedDate == null || _selectedState == null) {
                      return;
                    }
                    
                    await firestore.addTask(
                      TaskModel(
                        name: taskName.text,
                        dueDate: selectedDate!,
                        recurrence: int.parse(taskRecurrence.text),
                        state: _selectedState!,
                      ),                      
                    );

                    if (!context.mounted) return;

                    _resetForm();
                   
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // content: Text(
                          //   'Dein neuer Task wurde gespeichert:\n${taskName.text} ist am ${DateFormat('EEEE, d. MMM', 'de').format(selectedDate!)}, zum ersten Mal fällig und dann alle ${taskRecurrence.text} Tage.\nMomentaner Status: ${_selectedState!}'
                          // ),
                          content: Text(
                            'Dein neuer Task wurde gespeichert.'
                          ),
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