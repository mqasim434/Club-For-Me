import 'package:club_for_me/Features/Dashboard/dashboard.dart';
import 'package:club_for_me/Features/Dashboard/events/controller/events_controller.dart';
import 'package:club_for_me/Features/Dashboard/profile/controller/profile_controller.dart';
import 'package:club_for_me/Features/Onboarding/view/onboarding1_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashController extends GetxController {
  // Duration of the splash screen in seconds
  final int splashDuration = 3;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final profileController = Get.put(ProfileController());
  final eventsController = Get.put(EventsController());

  void checkUserStatus() async {
    Timer(Duration(seconds: splashDuration), () async {
      if (firebaseAuth.currentUser != null) {
        await profileController.fetchCurrentUser(firebaseAuth.currentUser!.uid);
        await eventsController.fetchEvents();
        Get.off(() => const DashboardScreen());
      } else {
        Get.to(
          () => const Onboarding1Screen(),
          duration: const Duration(seconds: 2),
          transition: Transition.fade,
        );
      }
    });
  }
}
