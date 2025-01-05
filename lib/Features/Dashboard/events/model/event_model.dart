import 'package:flutter/material.dart';

class EventNodel {
  String? id; // Unique identifier for the event
  String? eventName;
  String? venue;
  String? eventRepeat;
  DateTime? startDate;
  TimeOfDay? startTime;
  String? duration;
  TimeOfDay? endTime;
  String? description;
  List<String>? images; // Stores image URLs or paths
  String? organizer; // Organizer of the event

  EventNodel({
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
    this.organizer,
  });

  // Method to convert to a map for storing in databases (e.g., Firebase or SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'eventName': eventName,
      'venue': venue,
      'eventRepeat': eventRepeat,
      'startDate': startDate?.toIso8601String(),
      'startTime': startTime != null
          ? '${startTime!.hour}:${startTime!.minute}'
          : null,
      'duration': duration,
      'endTime': endTime != null
          ? '${endTime!.hour}:${endTime!.minute}'
          : null,
      'description': description,
      'images': images,
      'organizer': organizer,
    };
  }

  // Factory method to create an Event from a map
  factory EventNodel.fromMap(Map<String, dynamic> map) {
    return EventNodel(
      id: map['id'],
      eventName: map['eventName'],
      venue: map['venue'],
      eventRepeat: map['eventRepeat'],
      startDate: map['startDate'] != null
          ? DateTime.parse(map['startDate'])
          : null,
      startTime: map['startTime'] != null
          ? TimeOfDay(
              hour: int.parse(map['startTime'].split(':')[0]),
              minute: int.parse(map['startTime'].split(':')[1]),
            )
          : null,
      duration: map['duration'],
      endTime: map['endTime'] != null
          ? TimeOfDay(
              hour: int.parse(map['endTime'].split(':')[0]),
              minute: int.parse(map['endTime'].split(':')[1]),
            )
          : null,
      description: map['description'],
      images: List<String>.from(map['images'] ?? []),
      organizer: map['organizer'],
    );
  }
}
