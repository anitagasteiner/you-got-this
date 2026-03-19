import 'package:flutter/material.dart';
import 'screens/landing_page.dart';
import 'screens/tasks_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/tasks': (context) => TasksScreen(),
      },
      title: 'You got this!',
      theme: ThemeData(fontFamily: 'Montserrat'),
    );
  }

}



