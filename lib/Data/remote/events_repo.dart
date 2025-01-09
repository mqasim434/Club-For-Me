import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:club_for_me/Features/Dashboard/events/model/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EventsRepository {
  final FirebaseFirestore _firestore;

  EventsRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  /// Add a new event to Firestore
  Future<void> addEvent(EventModel event) async {
    try {
      final docRef = _firestore.collection('events').doc();
      event.id = docRef.id; // Assign the auto-generated ID to the event

      // Upload images to Firebase Storage and update the paths
      final List<String> imagesPaths = event.images!;
      final List<String> updatedImages = [];
      for (final imagePath in imagesPaths) {
        final String downloadUrl =
            await _uploadImageAndGetUrl(imagePath, event.id.toString());
        updatedImages.add(downloadUrl);
      }

      event.images = updatedImages;

      await docRef.set(event.toMap());
    } catch (e) {
      throw Exception('Failed to add event: $e');
    }
  }

  Future<String> _uploadImageAndGetUrl(String imagePath, String eventId) async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('events/$eventId/${imagePath.split('/').last}');

      // Upload the file
      final uploadTask = storageRef.putFile(File(imagePath));
      final snapshot = await uploadTask;

      // Get the download URL
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }

  /// Get a list of all events from Firestore
  Future<List<EventModel>> getEvents() async {
    try {
      final querySnapshot = await _firestore.collection('events').get();
      return querySnapshot.docs
          .map((doc) => EventModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch events: $e');
    }
  }

  /// Get a list of all events of an organizer from Firestore
  Future<List<EventModel>> getAllEventsOfOrganizer() async {
    try {
      final querySnapshot = await _firestore
          .collection('events')
          .where(
            'organizerId',
            isEqualTo: FirebaseAuth.instance.currentUser!.uid,
          )
          .get();
      return querySnapshot.docs
          .map((doc) => EventModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch events: $e');
    }
  }

  /// Get a single event by ID
  Future<EventModel?> getEventById(String id) async {
    try {
      final doc = await _firestore.collection('events').doc(id).get();
      if (doc.exists) {
        return EventModel.fromMap(doc.data()!);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to fetch event: $e');
    }
  }

  /// Update an existing event
  Future<void> updateEvent(EventModel event) async {
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
