import 'package:chat/screens/add_people/AddPeopleScreen.dart';
import 'package:chat/screens/chats/chats_screen.dart';
import 'package:chat/screens/see_events/See_events.dart';
import 'package:flutter/material.dart';
import 'package:chat/constants.dart';
import 'package:chat/models/User.dart';

class FriendRequestScreen extends StatelessWidget {


  const FriendRequestScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friend Requests'),
        backgroundColor: kPrimaryColor,
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
                              backgroundColor: Colors.green,
                            ),
                            child: Text('Accept'),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              // Implement deny functionality
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: Text('Deny'),
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
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChatsScreen(),
                ),
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
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FriendRequestScreen()),
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
      ),
    );
  }
}
