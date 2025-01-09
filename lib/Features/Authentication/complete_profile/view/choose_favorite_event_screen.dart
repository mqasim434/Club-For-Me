import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:club_for_me/Common/widgets/NextButton.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/choose_profile_photo_screen.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/choose_your_city_screen.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/widgets/profile_step_indicator_widget.dart';
import 'package:club_for_me/Utils/errors/error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseFavoriteEventScreen extends StatelessWidget {
  const ChooseFavoriteEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favouriteEventController = Get.put(FavouriteEventController());
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
                  step: 4,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Choose your favorite event',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Text(
                  'Get personalized event recomendation.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff8B8688),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Event Type',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Wrap(
                  spacing: 4,
                  children: [
                    MyChoiceChip(
                      label: 'Night Party',
                      type: 'event',
                    ),
                    MyChoiceChip(
                      label: 'Silent Party',
                      type: 'event',
                    ),
                    MyChoiceChip(
                      label: 'After Party',
                      type: 'event',
                    ),
                    MyChoiceChip(
                      label: 'Dinner Show',
                      type: 'event',
                    ),
                    MyChoiceChip(
                      label: 'Live/Concert',
                      type: 'event',
                    ),
                    MyChoiceChip(
                      label: 'Karaoke',
                      type: 'event',
                    ),
                    MyChoiceChip(
                      label: 'Festival',
                      type: 'event',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Music Genre',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Wrap(
                  spacing: 4,
                  children: [
                    MyChoiceChip(
                      label: 'Techno/Tech House',
                      type: 'genre',
                    ),
                    MyChoiceChip(
                      label: 'EDM',
                      type: 'genre',
                    ),
                    MyChoiceChip(
                      label: 'Revival',
                      type: 'genre',
                    ),
                    MyChoiceChip(
                      label: 'Trap/Hip-Hop',
                      type: 'genre',
                    ),
                    MyChoiceChip(
                      label: 'POP',
                      type: 'genre',
                    ),
                    MyChoiceChip(
                      label: 'Reggae',
                      type: 'genre',
                    ),
                    MyChoiceChip(
                      label: 'Latin',
                      type: 'genre',
                    ),
                    MyChoiceChip(
                      label: 'Jazz',
                      type: 'genre',
                    ),
                    MyChoiceChip(
                      label: 'Rock',
                      type: 'genre',
                    ),
                  ],
                ),
              ],
            ),
            NextButton(
              buttonLabel: 'Next',
              onPressed: () {
                favouriteEventController.addChoicesToFirebase().then((val) {
                  Get.to(() => const ChooseYourCityScreen());
                });
              },
            ),
          ],
        ),
      ),
    ));
  }
}

class MyChoiceChip extends StatelessWidget {
  final String label;
  final String type;

  const MyChoiceChip({
    super.key,
    required this.label,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final FavouriteEventController controller = Get.find();

    return Obx(() {
      final bool isSelected = type == 'event'
          ? controller.selectedEventType == label
          : controller.selectedMusicGenre == label;

      return ChoiceChip(
        label: Text(label),
        selected: isSelected,
        showCheckmark: false,
        selectedColor: Colors.black,
        labelStyle: isSelected
            ? const TextStyle(color: Colors.white)
            : const TextStyle(color: Colors.black),
        onSelected: (bool selected) {
          if (type == 'event') {
            controller.setSelectedEventType(label);
          } else if (type == 'genre') {
            controller.setSelectedMusicGenre(label);
          }
        },
      );
    });
  }
}

class FavouriteEventController extends GetxController {
  final RxString _selectedEventType = 'Night Party'.obs;
  final RxString _selectedMusicGenre = 'Techno/Tech House'.obs;

  String get selectedEventType => _selectedEventType.value;
  String get selectedMusicGenre => _selectedMusicGenre.value;

  void setSelectedEventType(String event) {
    _selectedEventType.value = event;
  }

  void setSelectedMusicGenre(String genre) {
    _selectedMusicGenre.value = genre;
  }

  Future<void> addChoicesToFirebase() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    try {
      firebaseFirestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'favouriteEvent': _selectedEventType.value,
        'musicGenre': _selectedMusicGenre.value,
      });
    } catch (e) {
      ErrorHandler.showErrorSnackbar(e.toString());
    }
  }
}
