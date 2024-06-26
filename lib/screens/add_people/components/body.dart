import 'package:chat/components/filled_outline_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/screens/signinOrSignUp/signin_or_signup_screen.dart';
import 'package:flutter/material.dart';
import'package:chat/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chat_card.dart';
import 'user_details_screen.dart'; // Import the UserDetailsScreen

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  Future<void> _logout(BuildContext context) async {
    // Delete token from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    // Navigate to SignInOrSignUpScreen
    SigninOrSignupScreen.navigateTo(context);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
          color: kPrimaryColor,
          child: Row(
            children: [
              FillOutlineButton(press: () {}, text: "Add People"),
              const SizedBox(width: kDefaultPadding),
              // Logout button
              Spacer(),
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () => _logout(context),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) => ChatCard(
              user: users[index], // Pass the user object to ChatCard
              press: () {
                // Navigate to user details screen when a user card is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailsScreen(user: users[index]),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}