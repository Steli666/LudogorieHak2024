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
      body: Center( // Center the container horizontally and vertically
        child: Container(
          width: double.infinity, // Fill the entire width of the screen
          height: double.infinity, // Fill the entire height of the screen
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/bg9.jpg'), // Replace 'background.jpg' with your image path
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Center the children horizontally
              mainAxisAlignment: MainAxisAlignment.start, // Position content at the top
              children: [
                CircleAvatar(
                  radius: 64,
                  backgroundImage: AssetImage(user.imagePath),
                ),
                SizedBox(height: kDefaultPadding / 2), // Add padding between the avatar and the text
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
                SizedBox(
                  width: 200,
                  child: PrimaryButton(
                    press: () {
                      // Implement the friend request functionality
                    },
                    text: 'Send Friend Request',
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
