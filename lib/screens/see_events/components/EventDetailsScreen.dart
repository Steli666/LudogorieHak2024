import 'package:flutter/material.dart';
import 'package:chat/models/Event.dart';
import 'package:chat/constants.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  const EventDetailsScreen({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
      ),
      body: Center( // Center the container horizontally and vertically
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/bg9.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // Center the children vertically
              crossAxisAlignment: CrossAxisAlignment.center, // Center the children horizontally
              children: [
                SizedBox(height: 50),
                Container(
                  color: Colors.transparent, // Set the color of the container to transparent
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    event.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center, // Center the text horizontally
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  event.description,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center, // Center the text horizontally
                ),
                SizedBox(height: 16),
                Text(
                  'Location: ${event.location}',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center, // Center the text horizontally
                ),
                SizedBox(height: 16),
                Text(
                  'Time: ${event.time}',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center, // Center the text horizontally
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Implement functionality for the button
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.deepPurple, // Text color and button color
                  ),
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
