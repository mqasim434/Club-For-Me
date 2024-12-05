import 'package:club_for_me/Common/widgets/NextButton.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/choose_profile_photo_screen.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/widgets/profile_step_indicator_widget.dart';
import 'package:club_for_me/Features/Authentication/signin/view/siginin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({super.key});

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
                  'language can be changed at anytime',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff8B8688),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                LanguageSelectorButton(
                  label: 'English',
                  isSelected: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                LanguageSelectorButton(
                  label: 'Italian',
                  isSelected: false,
                ),
                const SizedBox(
                  height: 16,
                ),
                LanguageSelectorButton(
                  label: 'Italian',
                  isSelected: false,
                ),
              ],
            ),
            NextButton(
              buttonLabel: 'Next',
              onPressed: () {
                Get.to(()=>const ChooseProfilePhotoScreen());
              },
            ),
          ],
        ),
      ),
    ));
  }
}

class LanguageSelectorButton extends StatelessWidget {
  LanguageSelectorButton({
    super.key,
    required this.label,
    this.isSelected = false,
  });

  String label;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          ),
          isSelected
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
