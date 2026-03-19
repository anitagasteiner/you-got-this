import 'package:flutter/material.dart';
import 'screens/landing_page.dart';
import 'screens/details.dart';

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
        '/details': (context) => DetailsScreen(),
      },
      title: 'You got this!',
      theme: ThemeData(fontFamily: 'Montserrat'),
    );
  }

}



