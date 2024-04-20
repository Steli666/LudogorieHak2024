import 'package:chat/constants.dart';
import 'package:chat/screens/chats/chats_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat/screens/add_people/AddPeopleScreen.dart';
import 'package:chat/screens/see_events/See_events.dart';
import 'components/body.dart';

class AddPeopleScreen extends StatefulWidget {
  const AddPeopleScreen({Key? key}) : super(key: key);

  @override
  _AddPeopleScreen createState() => _AddPeopleScreen();
}

class _AddPeopleScreen extends State<AddPeopleScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
        switch (value) {
          case 0:
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChatsScreen(),
            ),
            );
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
        title: const Text("Chats")
    );
  }
}
