
import 'package:flutter/material.dart';

class Event {
  final String title;
  final String description;
  final String imagePath;
  final String location;
  final String time;

  Event({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.location,
    required this.time
  });
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(

      title: json['title'] as String,
      description: json['description'] as String,
      imagePath: json['imagePath'] as String, location: json['location'], time: json['time'],
    );
  }
}

  List events = [
    Event(
      title: "Eco lager",
      description: "Nature",
      imagePath: "assets/images/user.png",
      time: "12 May 2024",
      location: 'New York'
    ),
    Event(
        title: "Art Museum",
        description: "Pictures",
        imagePath: "assets/images/user_2.png",
        time: "19 June 2024",
        location: 'London'
    ),
    Event(
        title: "Hakaton",
        description: "Coding",
        imagePath: "assets/images/user_3.png",
        time: "21 April 2024",
        location: 'Razgrad'
    ),
    Event(
        title: "Picnic",
        description: "Food",
        imagePath: "assets/images/user_4.png",
        time: "21 April 2024",
        location: 'Bulgaria'
    ),
  ];

