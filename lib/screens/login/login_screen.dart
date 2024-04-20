import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/bg9.jpg'),
            fit: BoxFit.cover, // Adjust as needed
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login', // Title text
                  style: TextStyle(
                    fontSize: 47.0, // Adjust font size as needed
                    fontWeight: FontWeight.bold, // Adjust font weight as needed
                    color: Colors.red.shade100, // Adjust color as needed
                  ),
                ),SizedBox(height: 36),

                Container(
                  height: 50.0, // Adjust height here
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.red.shade50,
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 50.0, // Same height as email field
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.red.shade50,
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 36),
                SizedBox(
                  width: 150.0,
                  height: 47.0, // Adjust button height
                  child: ElevatedButton(
                    onPressed: () {
                      // Add login functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple.shade700,
                      shadowColor: Colors.purple, // Set shadow color
                      elevation: 5, // Set elevation (shadow intensity)
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
