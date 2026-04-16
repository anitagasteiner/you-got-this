import 'package:flutter/material.dart';
// import '../common/colors.dart';
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
  String? _selectedState = 'To Do';

  // List<String> stateList = ['Done', 'Done Recently', 'Still Fine', 'To Do Soon', 'To Do'];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    taskName.dispose();
    taskRecurrence.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(hintText: 'Bezeichnung'),
            style: Theme.of(context).textTheme.bodyMedium,
            validator: (String? value) {
              if (value == null || value.isEmpty || RegExp(r'[^a-zA-Z0-9 ]').hasMatch(value)) {
                return 'Gib die Bezeichnung des Tasks ein.';
              }
              return null;
            },
            controller: taskName,
          ),
          SizedBox(height: 12),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Wiederholung in Tagen'),
            style: Theme.of(context).textTheme.bodyMedium,
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
            // style: TextStyle(color: BaseColors.dark),
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              labelText: 'Status',
              border: OutlineInputBorder(),
            ),
            initialValue: 'To Do',
            items: ['Done', 'Done Recently', 'Still Fine', 'To Do Soon', 'To Do']
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
                onPressed: () {
                  setState(() {
                    _formKey.currentState!.reset();
                    taskName.clear();
                    taskRecurrence.clear();
                  });
                },
                icon: Icons.remove_circle_rounded,
              ),
              BasicButton(
                text: 'OK',
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    // Process data
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text('Daten werden verarbeitet.')),
                    // );
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(taskName.text + taskRecurrence.text + _selectedState!),
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