import 'dart:async';

import 'package:club_for_me/Features/Dashboard/map/controller/google_maps_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GoogleMapsController controller = Get.put(GoogleMapsController());
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : GoogleMap(
                    onMapCreated: controller.onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: controller.currentLocation.value.latitude != 0 &&
                              controller.currentLocation.value.longitude != 0
                          ? controller.currentLocation.value
                          : controller.defaultLocation,
                      zoom: 15,
                    ),
                    zoomGesturesEnabled:
                        true, // Allow zooming with pinch gestures
                    scrollGesturesEnabled: true, // Allow map scrolling
                    tiltGesturesEnabled: true, // Allow tilting the map
                    rotateGesturesEnabled: true, // Allow rotating the map
                    myLocationEnabled: true, // Show user's current location
                    myLocationButtonEnabled: true, // Show location button\
                  ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.searchController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Find for food or restaurant...',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            controller.onSearchChanged(value);
                          } else {
                            controller.suggestions.value = [];
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.location_searching),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 250,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20)),
                child: SingleChildScrollView(
                    child: Column(
                  children: controller.suggestions.map((e) => Text(e)).toList(),
                )),
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: ChoiceChip(
                        label: Text('Night Party'),
                        selected: true,
                        selectedColor: Colors.black,
                        labelStyle: TextStyle(color: Colors.white),
                        checkmarkColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      label: Text('Live/Concert'),
                      selected: true,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      label: Text('EDM'),
                      selected: true,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      label: Text('Jazz'),
                      selected: true,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      label: Text('Rock'),
                      selected: true,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      label: Text('Karoake'),
                      selected: true,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      label: Text('Pop'),
                      selected: true,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      label: Text('Latin'),
                      selected: true,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MapCardWidget(
                        image: 'assets/images/Onboarding1/ob1-c3-i2.png',
                        title: 'Jo Malone London’s Mother’s Day Presents',
                        dateTime: "Wed, Apr 28 •5:30 PM",
                        location: "Radius Gallery • Santa Cruz, CA"),
                  ],
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}

class MapCardWidget extends StatelessWidget {
  MapCardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.dateTime,
    required this.location,
  });

  String image;
  String title;
  String dateTime;
  String location;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: screenHeight * 0.15,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  image,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dateTime,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Icon(Icons.bookmark)
                      ],
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                            ),
                            Row(
                              children: [
                                Text(
                                  location,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff8B8688),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
