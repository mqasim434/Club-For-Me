import 'package:club_for_me/Features/Dashboard/clubs/view/club_details_screen.dart';
import 'package:club_for_me/Features/Dashboard/events/view/widgets/event_card_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllClubsScreen extends StatelessWidget {
  const AllClubsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Clubs'),
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 12,
          ),
          Icon(Icons.more_vert),
        ],
      ),
      body: Expanded(child: ListView.builder(itemBuilder: (context, index) {
        return EventCardItemWidget(
            image: 'assets/images/event.png',
            title: 'Jo Malone London’s Mother’s Day Presents',
            dateTime: '',
            location: "Radius Gallery • Santa Cruz, CA",
            onTap: () {
              Get.to(() => ClubDetailsScreen());
            });
      })),
    );
  }
}
