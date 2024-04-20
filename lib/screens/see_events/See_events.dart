import 'package:chat/screens/add_people/AddPeopleScreen.dart';
import 'package:chat/screens/chats/chats_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat/constants.dart';
import 'components/body.dart';

class SeeEventsScreen extends StatefulWidget {
  const SeeEventsScreen({Key? key}) : super(key: key);

  @override
  _SeeEventsScreenState createState() => _SeeEventsScreenState();
}

class _SeeEventsScreenState extends State<SeeEventsScreen> {
  int _selectedIndex = 2; // Set the initial index to 2 for "See events"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement the functionality for the "I am going" button
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
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
        // Navigate to the corresponding screen when a bottom navigation item is tapped
        switch (value) {
          case 0:
          // Navigate to the ChatsScreen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatsScreen(),
              ),
            );
          case 1:
          // Navigate to the AddPeopleScreen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPeopleScreen(),
              ),
            );
            break;
          case 2:
          // Navigate to the SeeEventsScreen
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
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Add people"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "See events"),
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
      title: const Text("See Events"),
    );
  }
}

