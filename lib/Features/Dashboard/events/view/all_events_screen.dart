import 'package:club_for_me/Features/Dashboard/events/controller/events_controller.dart';
import 'package:club_for_me/Features/Dashboard/events/model/event_model.dart';
import 'package:club_for_me/Features/Dashboard/events/view/event_details_screen.dart';
import 'package:club_for_me/Features/Dashboard/events/view/search_events.dart';
import 'package:club_for_me/Features/Dashboard/events/view/widgets/event_card_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AllEventsScreen extends StatelessWidget {
  const AllEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EventsController eventsController = Get.find<EventsController>();
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
          itemCount: eventsController.events.length,
          itemBuilder: (context, index) {
            final EventModel event = eventsController.events[index];
            return EventCardItemWidget(
              image: event.images![0],
              title: event.eventName.toString(),
              dateTime:
                  "${DateFormat('EEE, MMM d').format(event.startDate!)} • ${DateFormat('h:mm a').format(event.startTime!)}",
              location: '${event.venue}',
              onTap: () {
                Get.to(() => EventDetailsScreen(
                      event: event,
                    ));
              },
            );
          }),
    );
  }
}
