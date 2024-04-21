import 'package:chat/components/filled_outline_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/models/Chat.dart';
import 'package:chat/screens/messages/message_screen.dart';
import 'package:chat/screens/signinOrSignUp/signin_or_signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chat_card.dart';

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
              FillOutlineButton(press: () {}, text: "Recent Chats"),
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
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MessagesScreen(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
