import 'package:club_for_me/Data/remote/auth_repo.dart';
import 'package:club_for_me/Features/Dashboard/controller/dashboard_controller.dart';
import 'package:club_for_me/Features/Dashboard/dashboard.dart';
import 'package:club_for_me/Utils/errors/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  static SigninController get instance => Get.find();

  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  final authRepo = Get.put(AuthenticationRepository());

  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> userSignin() async {
    try {
      EasyLoading.show(status: 'Sigining In...');

      // if (!signinFormKey.currentState!.validate()) {
      //   EasyLoading.dismiss();
      //   return;
      // }

      String? errorMessage = await authRepo.login(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      if (errorMessage != 'Success') {
        EasyLoading.dismiss();
        ErrorHandler.showErrorSnackbar(errorMessage ?? 'Login failed');
        return;
      }

      email.clear();
      password.clear();

      EasyLoading.dismiss();

      ErrorHandler.showSuccessSnackkbar('Success', 'Login Successful!');

      Get.to(() => DashboardScreen());
    } catch (e) {
      EasyLoading.dismiss();
      ErrorHandler.showErrorSnackbar(
        'An unexpected error occurred: ${e.toString()}',
      );
    }
  }
}
