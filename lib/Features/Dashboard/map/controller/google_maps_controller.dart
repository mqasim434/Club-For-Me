import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMapsController extends GetxController {
  late GoogleMapController mapController;
  final LatLng defaultLocation = const LatLng(37.7749, -122.4194);
  var currentLocation = const LatLng(0, 0).obs;
  var isLoading = true.obs;

  // Add searchController and suggestions list here
  TextEditingController searchController = TextEditingController();
  RxList<String> suggestions = <String>[].obs;

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

  // Function to search for a location and move the map
  Future<void> searchLocation(String query) async {
    if (query.isNotEmpty) {
      print(query);
      try {
        // Get location from address
        List<Location> locations = await locationFromAddress(query);

        if (locations.isNotEmpty) {
          // Get the latitude and longitude of the first result
          double latitude = locations[0].latitude;
          double longitude = locations[0].longitude;

          // Get placemark details (optional, for showing address in marker)
          List<Placemark> placemarks =
              await placemarkFromCoordinates(latitude, longitude);

          // Update camera position and markers
          currentLocation.value = LatLng(latitude, longitude);

          // Add marker to the map
          markers.clear();
          markers.add(Marker(
            markerId: MarkerId('searchedLocation'),
            position: LatLng(latitude, longitude),
            infoWindow: InfoWindow(title: placemarks[0].name),
          ));

          // Animate map camera
          mapController.animateCamera(
            CameraUpdate.newLatLng(LatLng(latitude, longitude)),
          );
        }
      } catch (e) {
        print("Error: $e");
      }
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

  // Function to handle search query changes and update suggestions
  Future<void> onSearchChanged(String query) async {
    print(query);
    if (query.isNotEmpty) {
      try {
        // Get location suggestions based on the query
        List<Location> locations = await locationFromAddress(query);

        if (locations.isNotEmpty) {
          // Create a list of suggestions with latitude and longitude
          suggestions.value = locations
              .map((loc) =>
                  '${loc.latitude}, ${loc.longitude}') // Format as "lat, long"
              .toList();
        }
      } catch (e) {
        print("Error while fetching suggestions: $e");
        suggestions.value = [];
      }
    } else {
      // Clear suggestions if query is empty
      suggestions.value = [];
    }
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
