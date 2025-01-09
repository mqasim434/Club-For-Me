import 'package:club_for_me/Data/remote/auth_repo.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/create_username_screen.dart';
import 'package:club_for_me/Utils/errors/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  final authRepo = Get.put(AuthenticationRepository());

  final phone = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confrimPassword = TextEditingController();

  // Admin Signup
  Future<void> userSignUp() async {
    try {
      // Start loading animation
      EasyLoading.show(status: 'Registring');

      // // Step 2: Form validation
      // if (!signupFormKey.currentState!.validate()) {
      //   EasyLoading.dismiss();
      //   return;
      // }

      // Step 3: Create admin account
      String? result = await authRepo.createUserAccount(
          email.text.trim(), password.text.trim(), phone.text.toString());

      if (result == 'Success') {
        email.clear();
        password.clear();

        EasyLoading.dismiss();

        // Show success message
        ErrorHandler.showSuccessSnackkbar(
            "Success", "Account is created successfully",);

        Get.to(() => const CreateUsernameScreen());
      } else {
        EasyLoading.dismiss();
        ErrorHandler.showErrorSnackbar('Error');
      }
    } catch (e) {
      EasyLoading.dismiss();
      ErrorHandler.showErrorSnackbar(
          'An unexpected error occurred: ${e.toString()}');
    }
  }
}
