import 'package:flutter/material.dart';
import 'package:intl/intl_standalone.dart'
  if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:you_got_this/common/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'services/firestore_service.dart';
import 'firebase_options.dart';
import './common/colors.dart';
import 'screens/home_screen.dart';
import 'screens/tasks_screen.dart';
import 'screens/new_task_screen.dart';


// void main() {
//   runApp(MainApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting();
  await findSystemLocale();
  runApp(
    Provider(
      create: (_) => FirestoreService(),
      child: const MainApp(),
    ),
  );
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
        '/new': (context) => NewTaskScreen(),
      },
      title: 'You got this!',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('de'),
        // Locale('en'),
      ],
      locale: const Locale('de'),
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: BaseColors.light,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: BaseColors.dark),
          bodyMedium: TextStyle(color: BaseColors.dark),
          titleLarge: TextStyle(color: BaseColors.dark),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: BaseColors.dark,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

}
