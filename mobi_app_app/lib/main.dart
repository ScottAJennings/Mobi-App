/*
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World! This is my first real change!'),
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/training_plan_screen.dart';
import 'screens/exercise_detail_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Training App',
      initialRoute: '/', // Start with the home screen
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/training-plan': (context) => TPlanScreen(),
        '/exercise-description': (context) => ExerciseDetailScreen(),
      },
    );
  }
}
