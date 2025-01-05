import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:club_for_me/Common/widgets/NextButton.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/choose_profile_photo_screen.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/widgets/profile_step_indicator_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageSelectorController = Get.put(LanguageSelectorController());

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
                    child: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ProfileStepIndicator(
                    step: 1,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Choose your language',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    'Language can be changed at anytime',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff8B8688),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  LanguageSelectorButton(label: 'English'),
                  const SizedBox(
                    height: 16,
                  ),
                  LanguageSelectorButton(label: 'Italian'),
                  const SizedBox(
                    height: 16,
                  ),
                  LanguageSelectorButton(label: 'Choose My Device Language'),
                ],
              ),
              NextButton(
                buttonLabel: 'Next',
                onPressed: () async {
                  // Save selected language to backend
                  final isSaved =
                      await languageSelectorController.saveSelectedLanguage();
                  if (isSaved) {
                    // Navigate to the next screen on success
                    Get.to(() => const ChooseProfilePhotoScreen());
                  } else {
                    // Show error if saving fails
                    Get.snackbar(
                      "Error",
                      "Failed to save language. Please try again.",
                      snackPosition: SnackPosition.BOTTOM,
                    );
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

class LanguageSelectorButton extends StatelessWidget {
  final String label;

  LanguageSelectorButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final languageSelectorController = Get.find<LanguageSelectorController>();
    return InkWell(
      onTap: () {
        languageSelectorController.changeSelectedOption(label);
      },
      child: Obx(() => Container(
            height: 56,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: languageSelectorController.selectedOption.value == label
                  ? Colors.black
                  : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color:
                        languageSelectorController.selectedOption.value == label
                            ? Colors.white
                            : Colors.black,
                  ),
                ),
                languageSelectorController.selectedOption.value == label
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : const SizedBox(),
              ],
            ),
          )),
    );
  }
}

class LanguageSelectorController extends GetxController {
  RxString selectedOption = 'English'.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void changeSelectedOption(String option) {
    selectedOption.value = option;
  }

  Future<bool> saveSelectedLanguage() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentReference userDoc =
            _firestore.collection('users').doc(user.uid);

        // Determine the language to save
        String languageToSave =
            selectedOption.value == "Choose My Device Language"
                ? ui.window.locale.languageCode // Get device language
                : selectedOption.value;

        // Fetch the current document
        DocumentSnapshot docSnapshot = await userDoc.get();

        if (docSnapshot.exists) {
          Map<String, dynamic>? data =
              docSnapshot.data() as Map<String, dynamic>?;

          // Check if the `language` field exists
          if (data != null && data.containsKey('language')) {
            // Update the `language` field
            await userDoc.update({
              'language': languageToSave,
            });
            print("Language updated successfully.");
          } else {
            print("Language field does not exist, not updating.");
          }
          return true;
        } else {
          print("User document does not exist.");
          return false;
        }
      } else {
        print("No user logged in.");
        return false;
      }
    } catch (e) {
      print("Error saving language: $e");
      return false;
    }
  }
}
