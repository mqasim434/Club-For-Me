import 'package:club_for_me/Common/widgets/NextButton.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/choose_favorite_event_screen.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/widgets/profile_step_indicator_widget.dart';
import 'package:club_for_me/Features/Authentication/signin/view/siginin_screen.dart';
import 'package:club_for_me/Features/Dashboard/dashboard.dart';
import 'package:club_for_me/Utils/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseYourCityScreen extends StatelessWidget {
  const ChooseYourCityScreen({super.key});

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
                  step: 5,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Pick Your City',
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
                MyTextField(
                  hintText: 'Pick Your City',
                  prefixIconImage: AppIcons.locationIcon,
                  suffixIconImage: AppIcons.arrowDownIcon,
                ),
                const SizedBox(
                  height: 4,
                ),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.location_searching,
                        size: 15,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Detect my location',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            NextButton(
              buttonLabel: 'Next',
              onPressed: () {
                Get.to(() => DashboardScreen());
              },
            ),
          ],
        ),
      ),
    ));
  }
}
