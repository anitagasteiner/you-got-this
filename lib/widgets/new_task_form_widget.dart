import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class NewTaskForm extends StatefulWidget {
  const NewTaskForm({super.key});

  @override
  State<NewTaskForm> createState() => _NewTaskFormState();
}

class _NewTaskFormState extends State<NewTaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _selectedValue;

  // List<String> stateList = ['Done', 'Done Recently', 'Still Fine', 'To Do Soon', 'To Do'];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(hintText: 'Task-Bezeichnung'),
            validator: (String? value) {
              if (value == null || value.isEmpty || RegExp(r'[^a-zA-Z0-9 ]').hasMatch(value)) {
                return 'Bitte Task-Bezeichnung eingeben';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Wiederholung'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty || RegExp(r'\D').hasMatch(value)) {
                return 'Bitte Wiederholung in Tagen eingeben';
              }
              return null;
            },
          ),
          SizedBox(height: 18),
          DropdownButtonFormField<String>(
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
                _selectedValue = value;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Bitte wähle einen Status.';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Daten werden verarbeitet.')),
                  );
                }
              },
              child: const Text('Bestätigen'),
            ),
          ),
        ],
      ),
    );
  }

}