import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class GoogleMapsController extends GetxController {
  late GoogleMapController mapController;
  final LatLng defaultLocation = const LatLng(37.7749, -122.4194);
  var currentLocation = const LatLng(0, 0).obs;
  var isLoading = false.obs;

  // Add searchController and suggestions list here
  TextEditingController searchController = TextEditingController();
  RxList<String> suggestions = <String>[].obs;
  String _apiKey = "AIzaSyCGXjH2olWHaRbJBH4SRNGmYfX60skyWs8";

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  /// Fetch the current location of the user
  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showError('Location services are disabled.');
      isLoading.value = false;
      return;
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showError('Location permissions are denied.');
        isLoading.value = false;
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showError(
          'Location permissions are permanently denied. Enable them in settings.');
      isLoading.value = false;
      return;
    }

    // Get the current position
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      currentLocation.value = LatLng(position.latitude, position.longitude);
    } catch (e) {
      _showError('Failed to get current location: $e');
    } finally {
      isLoading.value = false;
    }
  }

  RxSet<Marker> markers = <Marker>{}.obs;

  Future<void> onSearchChanged(String query) async {
    print('searching');
    if (query.isEmpty) {
      suggestions.value = [];
      return;
    }

    final String url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=$_apiKey";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Extract the description field from predictions
        final predictions = data['predictions'] as List<dynamic>;
        suggestions.value = predictions
            .map((prediction) => prediction['description'] as String)
            .toList();
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  /// Animate the camera to the current location
  void moveToCurrentLocation() {
    if (currentLocation.value.latitude != 0 &&
        currentLocation.value.longitude != 0) {
      mapController.animateCamera(
        CameraUpdate.newLatLng(currentLocation.value),
      );
    } else {
      _showError('Current location not available.');
    }
  }

  /// Show error messages
  void _showError(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.5),
      colorText: Colors.white,
    );
  }

  /// Set the map controller
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // Function to handle the selection of a suggestion
  Future<void> onSuggestionSelected(String suggestion) async {
    final parts = suggestion.split(',');
    final latitude = double.parse(parts[0].trim());
    final longitude = double.parse(parts[1].trim());

    // Move map to the selected location
    await moveToLocation(latitude, longitude);
  }

  // Function to animate the map to the selected location
  Future<void> moveToLocation(double latitude, double longitude) async {
    currentLocation.value = LatLng(latitude, longitude);

    // Add marker to the map
    markers.clear();
    markers.add(Marker(
      markerId: MarkerId('selectedLocation'),
      position: LatLng(latitude, longitude),
    ));

    // Animate camera to the new location
    await mapController.animateCamera(
      CameraUpdate.newLatLng(LatLng(latitude, longitude)),
    );
  }
}
