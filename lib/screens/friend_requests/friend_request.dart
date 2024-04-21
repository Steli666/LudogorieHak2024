import 'package:chat/screens/add_people/AddPeopleScreen.dart';
import 'package:chat/screens/chats/chats_screen.dart';
import 'package:chat/screens/see_events/See_events.dart';
import 'package:chat/screens/signinOrSignUp/signin_or_signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat/constants.dart';
import 'package:chat/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chat/screens/see_events/See_events.dart';

class FriendRequestScreen extends StatelessWidget {
  const FriendRequestScreen({Key? key}) : super(key: key);
  Future<void> _logout(BuildContext context) async {
    // Delete token from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    // Navigate to SignInOrSignUpScreen
    SigninOrSignupScreen.navigateTo(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text('Friend Requests'),
    backgroundColor: Colors.deepPurple.shade700,
    actions: [
    IconButton(
    icon: Icon(Icons.logout),
    onPressed: () => _logout(context),
    ),
    ],
    ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          User user = users[index];
          return Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(user.imagePath),
                ),
                SizedBox(width: kDefaultPadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.username,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Implement accept functionality
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple.shade500, // Change button color to green
                            ),
                            child: Text(
                              'Accept',
                              style: TextStyle(color: Colors.red.shade50), // Change text color to black
                            ),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              // Implement deny functionality
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black, // Change button color to red
                            ),
                            child: Text(
                              'Deny',
                              style: TextStyle(color: Colors.red.shade50), // Change text color to black
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 3, // Set the current index to match the friend request tab
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatsScreen()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPeopleScreen(),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeeEventsScreen(),
                ),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Add people",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "See events",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_to_photos),
            label: "Friend requests",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage("assets/images/user_2.png"),
            ),
            label: "Profile",
          ),
        ],
        backgroundColor: Colors.deepPurple.shade700, // Change bottom navigation bar color to purple
        selectedItemColor: Colors.white, // Change selected item color to white
        unselectedItemColor: Colors.grey, // Change unselected item color to grey
      ),
    );
  }
}
