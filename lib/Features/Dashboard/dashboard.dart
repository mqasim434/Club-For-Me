import 'package:club_for_me/Common/widgets/bottom_navigation_bar.dart';
import 'package:club_for_me/Features/Dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController =
        Get.put(DashboardController());
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: dashboardController.pageController,
          onPageChanged: dashboardController.changeSelectedPage,
          physics: NeverScrollableScrollPhysics(),
          children: dashboardController.screensList,
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
