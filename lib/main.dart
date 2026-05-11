import 'package:auto_hyphenating_text/auto_hyphenating_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl_standalone.dart'
  if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'data/services/firestore_service.dart';
import 'domain/task_service.dart';
import 'firebase_options.dart';
import 'ui/core/themes/app_theme.dart';
import 'domain/models/task_model.dart';
// import 'ui/home/home_screen.dart';
import 'ui/home/home_screen.dart';
import 'ui/tasks/tasks_screen.dart';
import 'ui/tasks/new_task_screen.dart';
import 'ui/tasks/edit_task_screen.dart';


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
  await initHyphenation();
  runApp(
    MultiProvider(
      providers: [
        Provider<FirestoreService>(
          create: (_) => FirestoreService(),
        ),
        ProxyProvider<FirestoreService, TaskService>(
          update: (_, firestore, _) => TaskService(firestore),
        ),
      ],
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
        '/edit': (context) {
          final task = ModalRoute.of(context)!.settings.arguments as TaskModel;
          return EditTaskScreen(task: task);
        },
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
      theme: AppTheme.main,
    );
  }

}
