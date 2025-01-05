import 'package:club_for_me/Data/remote/events_repo.dart';
import 'package:club_for_me/Features/Dashboard/events/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsController extends GetxController {
  final eventNameController = TextEditingController().obs;
  final venueController = TextEditingController().obs;
  final eventRepeatController = TextEditingController().obs;
  final startDateController = TextEditingController().obs;
  final startTimeController = TextEditingController().obs;
  final durationController = TextEditingController().obs;
  final endTimeController = TextEditingController().obs;
  final eventDescriptionController = TextEditingController().obs;
  var imagesList = <String>[].obs;

  final formKey = GlobalKey<FormState>();

  final EventsRepository _repository;

  var events = <EventNodel>[].obs;
  

  var isLoading = false.obs;

  EventsController({required EventsRepository repository})
      : _repository = repository;

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  /// Fetch all events from Firestore
  Future<void> fetchEvents() async {
    isLoading.value = true;
    try {
      final fetchedEvents = await _repository.getEvents();
      events.assignAll(fetchedEvents);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load events: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Add a new event
  Future<void> addEvent() async {
    isLoading.value = true;

    if (formKey.currentState!.validate()) {
      EventNodel event = EventNodel(
        eventName: eventNameController.value.text,
        venue: venueController.value.text,
        eventRepeat: eventRepeatController.value.text,
        startDate: DateTime.parse(startDateController.value.text),
        startTime: TimeOfDay.fromDateTime(DateTime.parse(startTimeController.value.text)),
        duration: durationController.value.text,
        endTime: TimeOfDay.fromDateTime(DateTime.parse(endTimeController.value.text)),
        description: eventDescriptionController.value.text,
        images: imagesList,
      );
      try {
        await _repository.addEvent(event);
        events.add(event); // Optimistically add to the list
        Get.snackbar('Success', 'Event added successfully');
      } catch (e) {
        Get.snackbar('Error', 'Failed to add event: $e');
      } finally {
        isLoading.value = false;
      }
    }
  }

  /// Update an existing event
  Future<void> updateEvent(EventNodel updatedEvent) async {
    isLoading.value = true;
    try {
      await _repository.updateEvent(updatedEvent);
      final index = events.indexWhere((e) => e.id == updatedEvent.id);
      if (index != -1) {
        events[index] = updatedEvent; // Update the list
      }
      Get.snackbar('Success', 'Event updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update event: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Delete an event
  Future<void> deleteEvent(String id) async {
    isLoading.value = true;
    try {
      await _repository.deleteEvent(id);
      events.removeWhere((e) => e.id == id); // Remove from the list
      Get.snackbar('Success', 'Event deleted successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete event: $e');
    } finally {
      isLoading.value = false;
    }
  }
}