import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class NewTaskForm extends StatefulWidget {
  const NewTaskForm({super.key});

  @override
  State<NewTaskForm> createState() => _NewTaskFormState();
}

class _NewTaskFormState extends State<NewTaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
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