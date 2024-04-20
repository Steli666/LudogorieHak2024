import 'package:flutter/material.dart';
import 'package:chat/models/User.dart'; // Import the User model
import 'package:chat/components/primary_button.dart'; // Import the PrimaryButton widget
import 'package:chat/constants.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 64,
                backgroundImage: AssetImage(user.imagePath),
              ),
            ),
            SizedBox(height: kDefaultPadding),
            Text(
              'Username: ${user.username}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: kDefaultPadding / 2),
            Text(
              'Full Name: ${user.first_name} ${user.last_name}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: kDefaultPadding / 2),
            Text(
              'Description: ${user.profile_description}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: kDefaultPadding),
            PrimaryButton(
              press: () {
                // Implement the friend request functionality
              },
              text: 'Send Friend Request',
            ),
          ],
        ),
      ),
    );
  }
}
