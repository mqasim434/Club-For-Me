import 'package:club_for_me/Features/Authentication/reset_password/view/otp_verification_screen.dart';
import 'package:club_for_me/Features/Authentication/signin/view/siginin_screen.dart';
import 'package:club_for_me/Utils/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
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
            SizedBox(
              height: 8,
            ),
            const Row(
              children: [
                Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            const Row(
              children: [
                Text(
                  'Please enter your email address\n to request a password reset',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            MyTextField(
              hintText: 'abc@gmail.com',
              prefixIconImage: AppIcons.emailIcon,
            ),
            SizedBox(
              height: 32,
            ),
            RoundedButtonWithIcon(
              buttonLabel: 'Send',
              icon: Icons.arrow_forward,
              onTap: () {
                Get.to(OtpVerificationScreen());
              },
            )
          ],
        ),
      ),
    ));
  }
}
