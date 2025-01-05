import 'package:club_for_me/Features/Authentication/signin/view/siginin_screen.dart';
import 'package:club_for_me/Utils/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              children: [
                Text(
                  'Save Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              children: [
                Text(
                  'Enter your new password',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            MyTextField(
              hintText: 'New Password',
              prefixIconImage: AppIcons.passwordIcon,
              isPassword: true,
            ),
            const SizedBox(
              height: 16,
            ),
            MyTextField(
              hintText: 'Confirm Password',
              prefixIconImage: AppIcons.passwordIcon,
              isPassword: true,
            ),
            const SizedBox(
              height: 32,
            ),
            RoundedButtonWithIcon(
              buttonLabel: 'Save',
              icon: Icons.arrow_forward,
              onTap: () {
                Get.to(const SigininScreen()); 
              },
            ),
          ],
        ),
      ),
    ));
  }
}
