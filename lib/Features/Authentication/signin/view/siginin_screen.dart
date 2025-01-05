import 'package:club_for_me/Features/Authentication/reset_password/view/reset_password_screen.dart';
import 'package:club_for_me/Features/Authentication/signin/controller/siginin_controller.dart';
import 'package:club_for_me/Features/Authentication/signup/view/signup_screen.dart';
import 'package:club_for_me/Utils/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigininScreen extends StatelessWidget {
  const SigininScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SigninController signinController = Get.put(SigninController());
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            // key: signinController.signinFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/logo/splash_logo.png',
                  width: 44.49,
                  height: 56.18,
                ),
                const Text(
                  'Club For Me',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.010,
                ),
                const Text(
                  'Welcome Back!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.010,
                ),
                const Text(
                  'Use Credentials to acees your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff8B8688),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.010,
                ),
                const Row(
                  children: [
                    Text(
                      'Sign in',
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
                  hintText: 'abc@gmail.com',
                  prefixIconImage: AppIcons.emailIcon,
                  controller: signinController.email,
                ),
                SizedBox(
                  height: screenHeight * 0.010,
                ),
                MyTextField(
                  hintText: 'Your Password',
                  prefixIconImage: AppIcons.passwordIcon,
                  controller: signinController.password,
                ),
                SizedBox(
                  height: screenHeight * 0.010,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Switch(value: true, onChanged: (value) {}),
                        const Text(
                          'Remember Me',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const ResetPasswordScreen());
                      },
                      child: const Text(
                        'Forgot Password?',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.016,
                ),
                RoundedButtonWithIcon(
                  buttonLabel: 'SIGN IN',
                  icon: Icons.arrow_forward,
                  onTap: () {
                    signinController.userSignin();
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
                    const Text("Don't have an account? "),
                    InkWell(
                        onTap: () {
                          Get.to(const SignupScreen());
                        },
                        child: const Text("Sign up")),
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

class RoundedButtonWithIcon extends StatelessWidget {
  RoundedButtonWithIcon({
    super.key,
    required this.buttonLabel,
    required this.icon,
    required this.onTap,
  });

  String? buttonLabel;
  IconData icon;
  GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 58,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 25,
              ),
              Text(
                buttonLabel.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              CircleAvatar(
                backgroundColor: const Color(0xff303030),
                radius: 15,
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  MyTextField({
    super.key,
    required this.hintText,
    this.suffixIconImage,
    required this.prefixIconImage,
    this.controller,
    this.isPassword = false,
  });

  String? hintText;
  String prefixIconImage;
  String? suffixIconImage;
  bool isPassword;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        prefixIcon: Image.asset(prefixIconImage.toString()),
        suffixIcon: suffixIconImage != null
            ? Image.asset(suffixIconImage.toString())
            : null,
      ),
    );
  }
}
