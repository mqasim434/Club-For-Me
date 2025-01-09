import 'dart:io';
import 'package:club_for_me/Common/widgets/NextButton.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/choose_favorite_event_screen.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/widgets/profile_step_indicator_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChooseProfilePhotoScreen extends StatelessWidget {
  const ChooseProfilePhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profilePhotoController = Get.put(ProfilePhotoController());

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  const SizedBox(height: 16),
                  ProfileStepIndicator(step: 3),
                  const SizedBox(height: 16),
                  const Text(
                    'Choose your profile photo',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    'Photo can be changed at anytime',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff8B8688),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              InkWell(
                onTap: () async {
                  await profilePhotoController.pickProfilePhoto();
                },
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: profilePhotoController.selectedPhoto.value.isEmpty
                        ? const CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(Icons.add, color: Colors.white),
                          )
                        : CircleAvatar(
                            backgroundImage: profilePhotoController
                                    .selectedPhoto.value
                                    .startsWith('http')
                                ? NetworkImage(
                                    profilePhotoController.selectedPhoto.value)
                                : FileImage(File(profilePhotoController
                                    .selectedPhoto.value)) as ImageProvider,
                            radius: 48,
                          ),
                  ),
                ),
              ),
              NextButton(
                buttonLabel: 'Next',
                onPressed: () async {
                  bool success =
                      await profilePhotoController.saveProfilePhoto();
                  if (success) {
                    Get.to(() => const ChooseFavoriteEventScreen());
                  } else {
                    Get.snackbar("Error", "Failed to save profile photo.");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePhotoController extends GetxController {
  RxString selectedPhoto = ''.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> pickProfilePhoto() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(source: ImageSource.gallery);

      if (photo != null) {
        // Show local image while uploading
        selectedPhoto.value = photo.path;

        // Show a loading indicator or feedback
        Get.snackbar("Uploading", "Uploading your photo...");

        // Upload image to Firebase Storage
        String downloadUrl = await uploadPhotoToFirebase(File(photo.path));

        // Update with Firebase URL after successful upload
        selectedPhoto.value = downloadUrl;

        // Notify user
        Get.snackbar("Success", "Photo uploaded successfully.");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick or upload photo: $e");
    }
  }

  Future<String> uploadPhotoToFirebase(File file) async {
    try {
      User? user = _auth.currentUser;
      if (user == null) throw Exception("No user logged in");

      String fileName =
          'profile_photos/${user.uid}/${DateTime.now().toIso8601String()}';
      Reference ref = _storage.ref().child(fileName);

      // Upload file
      TaskSnapshot snapshot = await ref.putFile(file);
      if (snapshot.state == TaskState.success) {
        // Get download URL
        return await ref.getDownloadURL();
      } else {
        throw Exception("Image upload failed");
      }
    } catch (e) {
      print("Error uploading photo: $e");
      throw e;
    }
  }

  Future<bool> saveProfilePhoto() async {
    try {
      User? user = _auth.currentUser;
      if (user != null && selectedPhoto.value.isNotEmpty) {
        DocumentReference userDoc =
            _firestore.collection('users').doc(user.uid);

        DocumentSnapshot docSnapshot = await userDoc.get();
        if (!docSnapshot.exists) {
          throw Exception("User document does not exist.");
        }

        await userDoc.update({
          'profilePic': selectedPhoto.value,
        });
        print("Profile photo updated successfully.");
        return true;
      } else {
        print("No user logged in or no photo selected.");
        return false;
      }
    } catch (e) {
      print("Error saving profile photo: $e");
      Get.snackbar("Error", "Failed to save profile photo: $e");
      return false;
    }
  }
}
