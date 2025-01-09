import 'package:club_for_me/Features/Dashboard/clubs/view/clubs_screen.dart';
import 'package:club_for_me/Features/Dashboard/events/view/manage_events_screen.dart';
import 'package:club_for_me/Features/Dashboard/home/home_screen.dart';
import 'package:club_for_me/Features/Dashboard/map/view/map_screen.dart';
import 'package:club_for_me/Features/Dashboard/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);

  RxString selectedLabel = 'Home'.obs;

  void changeSelectedLabel(String label) {
    selectedLabel.value = label;
    pageController.jumpToPage(getSelectedIndex(label));
  }

  void changeSelectedPage(int index) {
    selectedLabel.value = getLabelFromIndex(index);
  }

  int getSelectedIndex(String label) {
    switch (label) {
      case 'Home':
        return 0;
      case 'Events':
        return 1;
      case 'Clubs':
        return 2;
      case 'Map':
        return 3;
      case 'Profile':
        return 4;
      default:
        return 0;
    }
  }

  String getLabelFromIndex(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Events';
      case 2:
        return 'Clubs';
      case 3:
        return 'Map';
      case 4:
        return 'Profile';
      default:
        return 'Home';
    }
  }

  List<Widget> screensList = [
    const HomeScreen(),
    const ManageEventsScreen(),
    const ClubsScreen(),
    const MapScreen(),
    const ProfileScreen(),
  ];
}
