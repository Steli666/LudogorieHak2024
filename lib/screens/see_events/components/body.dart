import 'package:chat/components/filled_outline_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/models/Event.dart'; // Import the Event model
import 'package:chat/screens/see_events/components/EventDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'chat_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
              const SizedBox(width: kDefaultPadding)
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) => ChatCard(
              event: events[index], // Pass the event object to ChatCard
              press: () {
                // Navigate to event details screen when an event card is tapped
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
}