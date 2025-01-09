import 'package:club_for_me/Features/Dashboard/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final profileController = Get.find<ProfileController>();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          const Icon(Icons.share),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: (profileController.currentUser.value == null ||
                        profileController.currentUser.value!.profilePic == null)
                    ? const AssetImage('assets/images/profile-bg.png')
                    : NetworkImage(profileController
                        .currentUser.value!.profilePic
                        .toString()),
              ),
              Text(
                profileController.currentUser.value!.username.toString(),
                style: TextStyle(fontSize: 19),
              ),
              const Text(
                'Bangalore, India',
                style: TextStyle(fontSize: 10),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Column(
                    children: [
                      Text(
                        '350',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Following',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff747688)),
                      ),
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 30,
                    color: Colors.grey.withOpacity(0.5),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  const Column(
                    children: [
                      Text(
                        '346',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Followers',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff747688)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: screenWidth * 0.4,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.edit_note),
                      Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Me',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Interests',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      minimumSize: const Size(100, 30),
                      maximumSize: const Size(100, 40),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 18,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'CHANGE',
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Chip(
                    label: const Text(
                      'Night Party',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Chip(
                    label: const Text(
                      'Techno / Tech House',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
