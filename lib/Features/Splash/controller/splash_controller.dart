import 'package:club_for_me/Features/Dashboard/dashboard.dart';
import 'package:club_for_me/Features/Onboarding/view/onboarding1_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashController extends GetxController {
  // Duration of the splash screen in seconds
  final int splashDuration = 3;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void checkUserStatus() async {
    Timer(Duration(seconds: splashDuration), () async {
      if (firebaseAuth.currentUser != null) {
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
