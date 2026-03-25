import 'package:flutter/material.dart';
import 'package:you_got_this/common/colors.dart';
import 'screens/home_screen.dart';
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
        '/': (context) => HomeScreen(),
        '/tasks': (context) => TasksScreen(),
      },
      title: 'You got this!',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: BaseColors.light,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: BaseColors.dark),
          bodyMedium: TextStyle(color: BaseColors.dark),
          titleLarge: TextStyle(color: BaseColors.dark),
        ),
      ),
    );
  }

}
