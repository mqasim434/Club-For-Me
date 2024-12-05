import 'package:club_for_me/Features/Dashboard/events/view/event_details_screen.dart';
import 'package:club_for_me/Features/Dashboard/events/view/search_events.dart';
import 'package:club_for_me/Features/Dashboard/events/view/widgets/event_card_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllEventsScreen extends StatelessWidget {
  const AllEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Events'),
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => SearchEvents());
            },
            child: Icon(Icons.search),
          ),
          InkWell(
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return EventCardItemWidget(
              image: 'assets/images/event.png',
              title: 'Jo Malone London’s Mother’s Day Presents',
              dateTime: "Wed, Apr 28 • 5:30 PM",
              location: 'Radius Gallery • Santa Cruz, CA',
              onTap: () {
                Get.to(const EventDetailsScreen());
              },
            );
          }),
    );
  }
}
