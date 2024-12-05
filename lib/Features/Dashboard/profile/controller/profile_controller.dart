import 'package:club_for_me/Data/remote/user_repo.dart';
import 'package:club_for_me/Utils/errors/error_handler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  UserRepository userRepo = UserRepository();

  Future<void> updateUserField(
      String userId, Map<String, dynamic> updates) async {
    try {
      // Start loading animation
      EasyLoading.show(status: 'Updating User');

      // Call the repository to update the user fields in the database
      bool success = await userRepo.updateUserFields(userId, updates);

      if (success) {
        EasyLoading.dismiss();
        ErrorHandler.showSuccessSnackkbar(
            'Success', 'User information updated successfully');
      } else {
        EasyLoading.dismiss();
        ErrorHandler.showErrorSnackbar('Failed to update user details.');
      }
    } catch (e) {
      EasyLoading.dismiss();
      ErrorHandler.showErrorSnackbar(
          'An unexpected error occurred: ${e.toString()}');
    }
  }
}
