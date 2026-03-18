import 'package:flutter/material.dart';
import 'screens/landing_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'You got this!',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: LandingPage(),
    );
  }
}



