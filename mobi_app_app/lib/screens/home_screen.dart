import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> exercises = ["Push-ups", "Squats", "Lunges", "Plank"];

  void addExercise() {
    setState(() {
      exercises.add("New Exercise ${exercises.length + 1}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exercise List")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(exercises[index]),
                  onTap: () {
                    Navigator.pushNamed(context, '/exercise-description');
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Text("Go to Login Screen"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/training-plan');
            },
            child: Text("Go to Training Plan"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addExercise,
        child: Icon(Icons.add),
      ),
    );
  }
}
