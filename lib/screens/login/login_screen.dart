import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text("Login with Email and Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              focusNode: _emailFocus,
              onChanged: (_) {
                setState(() {
                  _isEmailValid = _isValidEmail(_emailController.text);
                });
              },
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _isEmailValid ? (_emailFocus.hasFocus ? Colors.blue : Colors.grey) : Colors.red,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              focusNode: _passwordFocus,
              onChanged: (_) {
                setState(() {
                  _isPasswordValid = _passwordController.text.length >= 5;
                });
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _isPasswordValid ? (_passwordFocus.hasFocus ? Colors.blue : Colors.grey) : Colors.red,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isEmailValid = _isValidEmail(_emailController.text);
                  _isPasswordValid = _passwordController.text.length >= 5;
                });

                if (!_isEmailValid || !_isPasswordValid) {
                  // If email or password is invalid, focus on the respective text field
                  if (!_isEmailValid) {
                    FocusScope.of(context).requestFocus(_emailFocus);
                  } else {
                    FocusScope.of(context).requestFocus(_passwordFocus);
                  }
                } else {
                  // Add login functionality here
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  bool _isValidEmail(String email) {
    // Regular expression for email validation
    final RegExp emailRegex =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

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
