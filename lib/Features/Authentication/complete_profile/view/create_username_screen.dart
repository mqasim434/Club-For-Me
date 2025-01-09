import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:club_for_me/Common/widgets/NextButton.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/choose_language_screen.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/widgets/profile_step_indicator_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUsernameScreen extends StatefulWidget {
  const CreateUsernameScreen({super.key});

  @override
  State<CreateUsernameScreen> createState() => _CreateUsernameScreenState();
}

class _CreateUsernameScreenState extends State<CreateUsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;

  Future<void> _checkAndSaveUsername() async {
    setState(() {
      _isLoading = true;
    });

    String username = _usernameController.text.trim();

    if (username.isEmpty) {
      Get.snackbar('Error', 'Username cannot be empty');
      setState(() {
        _isLoading = false;
      });
      return;
    }

    try {
      User? user =
          FirebaseAuth.instance.currentUser; // Get the current logged-in user

      if (user == null) {
        Get.snackbar('Error', 'No user is logged in. Please log in again.',
            snackPosition: SnackPosition.TOP);
        setState(() {
          _isLoading = false;
        });
        return;
      }

      // Check if the username is already taken
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('username', isEqualTo: username)
          .get();

      if (snapshot.docs.isNotEmpty) {
        // Check if the username belongs to the current user
        bool isCurrentUser = snapshot.docs.any((doc) => doc.id == user.uid);

        if (!isCurrentUser) {
          Get.snackbar('Error', 'Username already exists. Please try another.',
              snackPosition: SnackPosition.TOP);
          setState(() {
            _isLoading = false;
          });
          return;
        }
      }

      // Update the username for the current user
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'username': username,
      }, SetOptions(merge: true)); // Merge to prevent overwriting other fields

      Get.snackbar('Success', 'Username saved successfully!',
          snackPosition: SnackPosition.TOP);
      Get.to(() => const ChooseLanguageScreen());
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong. Please try again.',
          snackPosition: SnackPosition.TOP);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
                    'Create username',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    'Username can be changed at anytime',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff8B8688),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.person),
                      suffixIcon:
                          _isLoading ? const CircularProgressIndicator() : null,
                    ),
                  ),
                ],
              ),
              NextButton(
                buttonLabel: _isLoading ? 'Loading...' : 'Next',
                onPressed: _isLoading ? null : _checkAndSaveUsername,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
