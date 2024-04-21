import 'dart:convert';
import 'package:chat/screens/see_events/components/chat_card.dart';
import 'package:chat/screens/see_events/components/EventDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:chat/models/Event.dart';

import 'package:chat/screens/signinOrSignUp/signin_or_signup_screen.dart';
import 'package:chat/components/filled_outline_button.dart';
import 'package:chat/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Event> events = [];

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    final apiUrl = 'https://your-backend-api.com/events';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        events = data.map((eventData) => Event.fromJson(eventData)).toList();
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to fetch events. Please try again later.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
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
              FillOutlineButton(press: () {}, text: "Recent Events"),
              const SizedBox(width: kDefaultPadding),
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
            itemCount: events.length,
            itemBuilder: (context, index) => ChatCard(
              event: events[index],
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventDetailsScreen(event: events[index]),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  void _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    SigninOrSignupScreen.navigateTo(context);
  }
}
