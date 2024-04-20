import 'package:chat/components/primary_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat/screens/login/login_screen.dart';

import '../chats/chats_screen.dart';

class SigninOrSignupScreen extends StatelessWidget {
  const SigninOrSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              MediaQuery.of(context).platformBrightness == Brightness.light
                  ? "assets/icons/bg9.jpg"
                  : "assets/icons/bg9.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                const Spacer(flex: 2),
                Image.asset(
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? "assets/images/Logo_dark.png"
                      : "assets/images/Logo_dark.png",
                  height: 146,
                ),
                const Spacer(),
                PrimaryButton(
                  color: Colors.deepPurple.shade700,
                  text: "Sign In",
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  ),
                ),

              const SizedBox(height: kDefaultPadding * 1.5),
              PrimaryButton(
                color: Colors.deepPurple.shade700,
                text: "Sign Up",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                ),
              ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}