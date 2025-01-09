import 'package:club_for_me/Data/remote/user_repo.dart';
import 'package:club_for_me/Features/Dashboard/profile/model/user_model.dart';
import 'package:club_for_me/Utils/errors/error_handler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  UserRepository userRepo = UserRepository();

  // Observable to hold the current user data
  Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  // Method to set the logged-in user
  void setCurrentUser(UserModel user) {
    currentUser.value = user;
  }

  // Fetch and update the current user
  Future<void> fetchCurrentUser(String userId) async {
    try {
      UserModel? user = await userRepo.getUserById(userId); // Fetch user by ID
      if (user != null) {
        setCurrentUser(user); 
      } else {
        EasyLoading.dismiss();
        ErrorHandler.showErrorSnackbar('Failed to load user details.');
      }
    } catch (e) {
      ErrorHandler.showErrorSnackbar(
          'An unexpected error occurred: ${e.toString()}');
    }
  }

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
