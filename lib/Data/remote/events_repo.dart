import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:club_for_me/Features/Dashboard/events/model/event_model.dart';

class EventsRepository {
  final FirebaseFirestore _firestore;

  EventsRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  /// Add a new event to Firestore
  Future<void> addEvent(EventNodel event) async {
    try {
      final docRef = _firestore.collection('events').doc();
      event.id = docRef.id; // Assign the auto-generated ID to the event
      await docRef.set(event.toMap());
    } catch (e) {
      throw Exception('Failed to add event: $e');
    }
  }

  /// Get a list of all events from Firestore
  Future<List<EventNodel>> getEvents() async {
    try {
      final querySnapshot = await _firestore.collection('events').get();
      return querySnapshot.docs
          .map((doc) => EventNodel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch events: $e');
    }
  }

  /// Get a single event by ID
  Future<EventNodel?> getEventById(String id) async {
    try {
      final doc = await _firestore.collection('events').doc(id).get();
      if (doc.exists) {
        return EventNodel.fromMap(doc.data()!);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to fetch event: $e');
    }
  }

  /// Update an existing event
  Future<void> updateEvent(EventNodel event) async {
    if (event.id == null) {
      throw Exception('Event ID is required for updating');
    }
    try {
      await _firestore.collection('events').doc(event.id).update(event.toMap());
    } catch (e) {
      throw Exception('Failed to update event: $e');
    }
  }

  /// Delete an event by ID
  Future<void> deleteEvent(String id) async {
    try {
      await _firestore.collection('events').doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete event: $e');
    }
  }
}
