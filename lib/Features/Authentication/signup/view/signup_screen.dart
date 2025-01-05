import 'package:club_for_me/Features/Authentication/complete_profile/view/create_username_screen.dart';
import 'package:club_for_me/Features/Authentication/signin/view/siginin_screen.dart';
import 'package:club_for_me/Features/Authentication/signup/controller/signup_controller.dart';
import 'package:club_for_me/Utils/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.put(SignupController());
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            // key: signupController.signupFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back)),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.010,
                ),
                MyTextField(
                  hintText: 'Enter mobile number',
                  prefixIconImage: AppIcons.phoneIcon,
                  controller: signupController.phone,
                ),
                SizedBox(
                  height: screenHeight * 0.010,
                ),
                MyTextField(
                  hintText: 'abc@gmail.com',
                  prefixIconImage: AppIcons.emailIcon,
                  controller: signupController.email,
                ),
                SizedBox(
                  height: screenHeight * 0.010,
                ),
                MyTextField(
                  hintText: 'Your Password',
                  prefixIconImage: AppIcons.passwordIcon,
                  isPassword: true,
                  controller: signupController.password,
                ),
                SizedBox(
                  height: screenHeight * 0.010,
                ),
                MyTextField(
                  hintText: 'Confirm Password',
                  prefixIconImage: AppIcons.passwordIcon,
                  isPassword: true,
                  controller: signupController.confrimPassword,
                ),
                SizedBox(
                  height: screenHeight * 0.016,
                ),
                RoundedButtonWithIcon(
                  buttonLabel: 'SIGN UP',
                  icon: Icons.arrow_forward,
                  onTap: () {
                    signupController.userSignUp();
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.016,
                ),
                const Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff8B8688),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.016,
                ),
                Card(
                  child: Container(
                    height: 56,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/google.png'),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('Login with Google')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.010,
                ),
                Card(
                  child: Container(
                    height: 56,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/facebook.png'),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('Login with Facebook')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.016,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    InkWell(
                        onTap: () {
                          Get.to(() => const SigininScreen());
                        },
                        child: const Text(" Sign in")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
