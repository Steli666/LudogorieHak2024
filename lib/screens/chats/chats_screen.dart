import 'package:chat/constants.dart';
import 'package:chat/screens/friend_requests/friend_request.dart';
import 'package:flutter/material.dart';
import 'package:chat/screens/add_people/AddPeopleScreen.dart';
import 'package:chat/screens/see_events/See_events.dart';
import 'components/body.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
    switch (value) {
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
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Add people"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "See events"),
        BottomNavigationBarItem(icon: Icon(Icons.add_to_photos), label: "Friend requests"),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          label: "Profile",
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      automaticallyImplyLeading: false,
      title: const Text("Chats")
    );
  }
}
