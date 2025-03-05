import 'package:flutter/material.dart';

class ExerciseDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? exercise =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
          title: Text(exercise?['exercise_name'] ?? "Exercise Description")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Exercise Name: ${exercise?['exercise_name'] ?? "Unknown"}"),
            Text("Category: ${exercise?['category'] ?? "Unknown"}"),
            Text("Reps: ${exercise?['reps'] ?? "N/A"}"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
