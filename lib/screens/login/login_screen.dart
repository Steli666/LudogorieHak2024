import 'package:chat/screens/Token/Token.dart';
import 'package:chat/screens/chats/chats_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool _isEmailValid = true;
  bool _isPasswordValid = true;

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
                  'Login',
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
                      fillColor: _isEmailValid ? Colors.red.shade50 : Colors.red,
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
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: _isPasswordValid ? Colors.red.shade50 : Colors.red,
                      labelText: 'Password',
                      hintText: 'Enter your password',
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



  void _loginUser(String email, String password) async {
    // Your backend API URL
    String apiUrl = 'https://your-backend-api.com/login';
    String? storedToken = await getToken();
    Map<String, String> headers = {
      'Authorization': 'Bearer $storedToken'
    };
    // Make a POST request to your backend API
    var response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'email': email,
        'password': password,
      },
      headers: headers
    );

    // Check if the request was successful
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatsScreen()),
      );
    } else {
      // Login failed, show error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Error'),
            content: Text('Invalid email or password. Please try again.'),
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
  void _validateInputs() {
    setState(() {
      _isEmailValid = _isValidEmail(_emailController.text);
      _isPasswordValid = _passwordController.text.length >= 5;
    });
    if (_isEmailValid && _isPasswordValid) {
      // Call a function to send the email and password to the backend
      _loginUser(_emailController.text, _passwordController.text);
    }
  }

  bool _isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }
}
