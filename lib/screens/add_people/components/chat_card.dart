
import 'package:chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:chat/models/User.dart';


class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.user,
    required this.press,
  }) : super(key: key);

  final User user;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
        child: Row(
          children: [
            // User image
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(user.imagePath),
            ),
            // User details (username)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.username,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
