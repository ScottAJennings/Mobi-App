import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login Page"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to HomeScreen
              },
              child: Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
