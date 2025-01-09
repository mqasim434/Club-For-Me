import 'package:club_for_me/Data/remote/auth_repo.dart';
import 'package:club_for_me/Features/Dashboard/dashboard.dart';
import 'package:club_for_me/Features/Dashboard/profile/controller/profile_controller.dart';
import 'package:club_for_me/Utils/errors/error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  static SigninController get instance => Get.find();

  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  final authRepo = Get.put(AuthenticationRepository());

  final email = TextEditingController();
  final password = TextEditingController();

  final profileController = Get.find<ProfileController>();

  Future<void> userSignin() async {
    try {
      EasyLoading.show(status: 'Sigining In...');

      String? errorMessage = await authRepo.login(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      if (errorMessage != 'Success') {
        EasyLoading.dismiss();
        ErrorHandler.showErrorSnackbar(errorMessage ?? 'Login failed');
        return;
      }

       await profileController.fetchCurrentUser(FirebaseAuth.instance.currentUser!.uid);

      email.clear();
      password.clear();

      EasyLoading.dismiss();

      ErrorHandler.showSuccessSnackkbar('Success', 'Login Successful!');

      Get.to(() => const DashboardScreen());
    } catch (e) {
      EasyLoading.dismiss();
      ErrorHandler.showErrorSnackbar(
        'An unexpected error occurred: ${e.toString()}',
      );
    }
  }

  Future<void> signinWithGoogle() async {
    try {
      await authRepo.handleGoogleSignIn();
      await profileController.fetchCurrentUser(FirebaseAuth.instance.currentUser!.uid);
    } catch (e) {
      ErrorHandler.showErrorSnackbar(
        'An unexpected error occurred: ${e.toString()}',
      );
    }
  }
}
