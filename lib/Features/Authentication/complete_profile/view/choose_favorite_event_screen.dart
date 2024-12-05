import 'package:club_for_me/Common/widgets/NextButton.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/choose_profile_photo_screen.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/choose_your_city_screen.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/widgets/profile_step_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseFavoriteEventScreen extends StatelessWidget {
  const ChooseFavoriteEventScreen({super.key});

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
                    ChoiceChip(
                      label: Text('Night Party'),
                      selected: true,
                      showCheckmark: false,
                      selectedColor: Colors.black,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    ChoiceChip(
                      label: Text('Silent Party'),
                      selected: true,
                      showCheckmark: false,
                    ),
                    ChoiceChip(
                      label: Text('After Party'),
                      selected: true,
                      showCheckmark: false,
                    ),
                    ChoiceChip(
                      label: Text('Dinner Show'),
                      selected: true,
                      showCheckmark: false,
                    ),
                    ChoiceChip(
                      label: Text('Live/Concert'),
                      selected: true,
                      showCheckmark: false,
                    ),
                    ChoiceChip(
                      label: Text('Karaoke'),
                      selected: true,
                      showCheckmark: false,
                    ),
                    ChoiceChip(
                      label: Text('Festival'),
                      selected: true,
                      showCheckmark: false,
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
                    ChoiceChip(
                      label: Text('Techno/Tech House'),
                      selected: true,
                      showCheckmark: false,
                      selectedColor: Colors.black,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    ChoiceChip(
                      label: Text('EDM'),
                      selected: true,
                      showCheckmark: false,
                    ),
                    ChoiceChip(
                      label: Text('Revival'),
                      selected: true,
                      showCheckmark: false,
                    ),
                    ChoiceChip(
                      label: Text('Trap/Hip-Hop'),
                      selected: true,
                      showCheckmark: false,
                    ),
                    ChoiceChip(
                      label: Text('POP'),
                      selected: true,
                      showCheckmark: false,
                    ),
                    ChoiceChip(
                      label: Text('Reggae'),
                      selected: true,
                      showCheckmark: false,
                    ),
                    ChoiceChip(
                      label: Text('Latin'),
                      selected: true,
                      showCheckmark: false,
                    ),
                    ChoiceChip(
                      label: Text('JAzz'),
                      selected: true,
                      showCheckmark: false,
                    ),
                    ChoiceChip(
                      label: Text('Rock'),
                      selected: true,
                      showCheckmark: false,
                    ),
                  ],
                ),
              ],
            ),
            NextButton(
              buttonLabel: 'Next',
              onPressed: () {
                Get.to(()=>const ChooseYourCityScreen());
              },
            ),
          ],
        ),
      ),
    ));
  }
}
