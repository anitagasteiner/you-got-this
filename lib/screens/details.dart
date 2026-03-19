import 'package:flutter/material.dart';
import 'navbars.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarTop(),
      body: Center(
        child: ElevatedButton(
          child: Text('zurück'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: const AppBarBottom(),
    );
  }
}