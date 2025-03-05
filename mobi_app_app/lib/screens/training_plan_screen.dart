import 'package:flutter/material.dart';

class TPlanScreen extends StatefulWidget {
  @override
  _TPlanScreenState createState() => _TPlanScreenState();
}

class _TPlanScreenState extends State<TPlanScreen> {
  List<String> exercises = ["Push-ups", "Squats", "Lunges", "Plank"];

  void addExercise() {
    setState(() {
      exercises.add("New Exercise ${exercises.length + 1}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Training Plan")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(exercises[index]));
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Go back to HomeScreen
            },
            child: Text("Back to Home"),
          ),
        ],
      ),
    );
  }
}
