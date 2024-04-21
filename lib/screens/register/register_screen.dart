import 'dart:convert';
import 'dart:developer';

import 'package:chat/screens/chats/chats_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _profileDescriptionController = TextEditingController();
  final TextEditingController _username = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _profileDescriptionFocus = FocusNode();
  final FocusNode _usernameFocus = FocusNode();

  bool _isEmailValid = true;
  bool _isFirstNameValid = true;
  bool _isLastNameValid = true;
  bool _isPasswordValid = true;
  bool _isProfileDescriptionValid = true;
  bool _isUsername = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/bg9.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 47.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade100,
                  ),
                ),
                SizedBox(height: 36),
                Container(
                  height: 50.0,
                  child: TextField(
                    controller: _emailController,
                    focusNode: _emailFocus,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: _isEmailValid ? Colors.red.shade50 : Colors
                          .red,
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 50.0,
                  child: TextField(
                    controller: _firstNameController,
                    focusNode: _firstNameFocus,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: _isFirstNameValid ? Colors.red.shade50 : Colors
                          .red,
                      labelText: 'First Name',
                      hintText: 'Enter your first name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 50.0,
                  child: TextField(
                    controller: _lastNameController,
                    focusNode: _lastNameFocus,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: _isLastNameValid ? Colors.red.shade50 : Colors
                          .red,
                      labelText: 'Last Name',
                      hintText: 'Enter your last name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 50.0,
                  child: TextField(
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: _isPasswordValid ? Colors.red.shade50 : Colors
                          .red,
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 50.0,
                  child: TextField(
                    controller: _username,
                    focusNode: _usernameFocus,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: _isUsername ? Colors.red.shade50 : Colors.red,
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 50.0,
                  child: TextField(
                    controller: _profileDescriptionController,
                    focusNode: _profileDescriptionFocus,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: _isProfileDescriptionValid
                          ? Colors.red.shade50
                          : Colors.red,
                      labelText: 'Profile Description',
                      hintText: 'Enter your profile description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 36),
                SizedBox(
                  width: 150.0,
                  height: 47.0,
                  child: ElevatedButton(
                    onPressed: () {
                      _validateInputs();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple.shade700,
                      shadowColor: Colors.purple,
                      elevation: 5,
                    ),
                    child: Text(
                      'Register',
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

  void _validateInputs() {
    setState(() {
      _isEmailValid = _isValidEmail(_emailController.text);
      _isFirstNameValid = _firstNameController.text.isNotEmpty;
      _isLastNameValid = _lastNameController.text.isNotEmpty;
      _isPasswordValid = _passwordController.text.length >= 5;
      _isProfileDescriptionValid =
          _profileDescriptionController.text.isNotEmpty;
      _isUsername = _username.text.isNotEmpty;
    });
    _registerUser(
      _emailController.text,
      _firstNameController.text,
      _lastNameController.text,
      _passwordController.text,
      _profileDescriptionController.text,
      _username.text,
      context,
    );
  }

  bool _isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _profileDescriptionController.dispose();
    _emailFocus.dispose();
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    _passwordFocus.dispose();
    _profileDescriptionFocus.dispose();
    super.dispose();
  }


  void _registerUser(String email,
      String firstName,
      String lastName,
      String password,
      String profileDescription,
      String username,
      BuildContext context,) async {
    // Your backend API URL
    String apiUrl = 'hakaton.gigalixirapp.com';

    // Define the request body as a JSON object
    var body = {
      'email': email,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'password': password,
      'profile_description': profileDescription,
    };

    // Make a POST request to your backend API
    var response = await http.post(
      Uri.https(apiUrl, "/api/register"),
      body: body
    );

    log("adwaw  " + (response.statusCode as String));
    if (response.statusCode == 200) {
      // Registration successful, navigate to ChatsScreen
      log("hello");
      print("hello");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatsScreen()),
      );
    } else {
      // Registration failed, show error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Registration Error'),
            content: Text(
                'Username or email already in use. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
