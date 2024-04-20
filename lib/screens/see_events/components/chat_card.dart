
import 'package:chat/constants.dart';
import 'package:chat/models/Event.dart'; // Import the Event model
import 'package:flutter/material.dart';


class ChatCard extends StatelessWidget {


  const ChatCard({
    Key? key,
    required this.event,
    required this.press,
  }) : super(key: key);

  final Event event;
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
            // Event image
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(event.imagePath),
            ),
            // Event details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        event.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
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