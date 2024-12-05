import 'package:club_for_me/Common/widgets/NextButton.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/choose_favorite_event_screen.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/widgets/profile_step_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseProfilePhotoScreen extends StatelessWidget {
  const ChooseProfilePhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  step: 3,
                ),
                const SizedBox(
                  height: 16,
                ),
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
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(1)),
                child: const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            NextButton(
              buttonLabel: 'Next',
              onPressed: () {
                Get.to(()=>const ChooseFavoriteEventScreen());
              },
            ),
          ],
        ),
      ),
    ));
  }
}
