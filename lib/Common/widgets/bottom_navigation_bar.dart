import 'package:club_for_me/Features/Dashboard/controller/dashboard_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find<
        DashboardController>(); // Use Get.find to retrieve the controller
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.08,
      color: Colors.white,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarItem(
              label: 'Home',
              icon: CupertinoIcons.home,
              controller: dashboardController,
            ),
            NavBarItem(
              label: 'Events',
              icon: CupertinoIcons.calendar,
              controller: dashboardController,
            ),
            NavBarItem(
              label: 'Clubs',
              icon: CupertinoIcons.suit_club,
              controller: dashboardController,
            ),
            NavBarItem(
              label: 'Map',
              icon: CupertinoIcons.location_solid,
              controller: dashboardController,
            ),
            NavBarItem(
              label: 'Profile',
              icon: CupertinoIcons.person,
              controller: dashboardController,
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final DashboardController controller;

  const NavBarItem({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isSelected = controller.selectedLabel.value == label;
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          onTap: () {
            controller.changeSelectedLabel(label);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 2,
                color: isSelected ? Colors.black : Colors.transparent,
              ),
              Column(
                children: [
                  Icon(
                    icon,
                    color: isSelected ? Colors.black : const Color(0xffB2B2B2),
                  ),
                  Text(
                    label,
                    style: TextStyle(
                        fontSize: 12,
                        color: isSelected
                            ? Colors.black
                            : const Color(0xffB2B2B2)),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
