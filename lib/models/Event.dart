
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
      title: "Jenny Wilson",
      description: "Hope you are doing well...",
      imagePath: "assets/images/user.png",
      time: "3m ago",
      location: 'New York'
    ),
    Event(
        title: "Jenny Wilson",
        description: "Hope you are doing well...",
        imagePath: "assets/images/user.png",
        time: "3m ago",
        location: 'New York'
    ),
    Event(
        title: "Jenny Wilson",
        description: "Hope you are doing well...",
        imagePath: "assets/images/user.png",
        time: "3m ago",
        location: 'New York'
    ),
    Event(
        title: "Jenny Wilson",
        description: "Hope you are doing well...",
        imagePath: "assets/images/user.png",
        time: "3m ago",
        location: 'New York'
    ),
    Event(
        title: "Jenny Wilson",
        description: "Hope you are doing well...",
        imagePath: "assets/images/user.png",
        time: "3m ago",
        location: 'New York'
    ),
    Event(
        title: "Jenny Wilson",
        description: "Hope you are doing well...",
        imagePath: "assets/images/user.png",
        time: "3m ago",
        location: 'New York'
    ),
    Event(
        title: "Jenny Wilson",
        description: "Hope you are doing well...",
        imagePath: "assets/images/user.png",
        time: "3m ago",
        location: 'New York'
    ),
    Event(
        title: "Jenny Wilson",
        description: "Hope you are doing well...",
        imagePath: "assets/images/user.png",
        time: "3m ago",
        location: 'New York'
    ),
  ];

