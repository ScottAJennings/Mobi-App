import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> exercises = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchExercises(); // Fetch data when screen loads
  }

  // Fetch exercises from Flask API
  Future<void> fetchExercises() async {
    final response =
        await http.get(Uri.parse("http://10.0.2.2:5000/exercises"));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      setState(() {
        exercises =
            data.map((exercise) => exercise["name"].toString()).toList();
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception("Failed to load exercises");
    }
  }

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
            child: isLoading
                ? Center(
                    child:
                        CircularProgressIndicator()) // Show loading indicator
                : ListView.builder(
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
