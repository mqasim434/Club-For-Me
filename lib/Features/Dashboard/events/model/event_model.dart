import 'package:flutter/material.dart';

class EventModel {
  String? id; // Unique identifier for the event
  String? eventName;
  String? venue;
  String? eventRepeat;
  DateTime? startDate;
  DateTime? startTime; // Stored as DateTime
  String? duration;
  DateTime? endTime; // Stored as DateTime
  String? description;
  List<String>? images;
  String? organizerId;

  EventModel({
    this.id,
    this.eventName,
    this.venue,
    this.eventRepeat,
    this.startDate,
    this.startTime,
    this.duration,
    this.endTime,
    this.description,
    this.images,
    this.organizerId,
  });

  // Method to convert to a map for storing in databases (e.g., Firebase or SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'eventName': eventName,
      'venue': venue,
      'eventRepeat': eventRepeat,
      'startDate': startDate?.toIso8601String(),
      'startTime': startTime?.toIso8601String(), // Store as ISO8601 string
      'duration': duration,
      'endTime': endTime?.toIso8601String(), // Store as ISO8601 string
      'description': description,
      'images': images,
      'organizerId': organizerId,
    };
  }

  // Factory method to create an Event from a map
  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'],
      eventName: map['eventName'],
      venue: map['venue'],
      eventRepeat: map['eventRepeat'],
      startDate:
          map['startDate'] != null ? DateTime.parse(map['startDate']) : null,
      startTime:
          map['startTime'] != null ? DateTime.parse(map['startTime']) : null,
      duration: map['duration'],
      endTime: map['endTime'] != null ? DateTime.parse(map['endTime']) : null,
      description: map['description'],
      images: List<String>.from(map['images'] ?? []),
      organizerId: map['organizerId'],
    );
  }
}
