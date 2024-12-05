import 'package:club_for_me/Features/Authentication/signin/view/siginin_screen.dart';
import 'package:club_for_me/Features/Chat/messages_screen.dart';
import 'package:club_for_me/Features/Dashboard/profile/view/my_profile_screen.dart';
import 'package:club_for_me/Features/Notifications/view/notifications_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Stack(
      children: [
        Container(
          width: double.infinity,
          height: screenHeight * 0.12,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/profile-bg.png'),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: (screenHeight * 0.12) - 16 - 30,
                ),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile.jpeg'),
                ),
                const Text(
                  'Surendhar P',
                  style: TextStyle(fontSize: 19),
                ),
                const Text(
                  'Bangalore, India',
                  style: TextStyle(fontSize: 10),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  width: screenWidth,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: const Color(0xffEFEFEF),
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: [
                      ProfileButtonWidget(
                        label: 'My Profile',
                        icon: Icons.person_outline,
                        onTap: () {
                          Get.to(() => const MyProfileScreen());
                        },
                      ),
                      ProfileButtonWidget(
                        label: 'Messages',
                        icon: Icons.message,
                        onTap: () {
                          Get.to(() => const MessagesScreen());
                        },
                      ),
                      ProfileButtonWidget(
                        label: 'Favorites',
                        icon: Icons.bookmark_outline,
                        onTap: () {},
                      ),
                      ProfileButtonWidget(
                        label: 'Notifications',
                        icon: Icons.notifications_outlined,
                        onTap: () {
                          Get.to(() => const NotificationsScreen());
                        },
                      ),
                      ProfileButtonWidget(
                        label: 'Events',
                        icon: Icons.event,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  'Events',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  width: screenWidth,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: const Color(0xffEFEFEF),
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.person_add_alt),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Request for Organizer',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            minimumSize: const Size(80, 30),
                            maximumSize: const Size(80, 40),
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {},
                        child: const Text(
                          'Request',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  'About',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  width: screenWidth,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: const Color(0xffEFEFEF),
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: [
                      ProfileButtonWidget(
                        label: 'Contact Us',
                        icon: Icons.mail_outline,
                        onTap: () {},
                      ),
                      ProfileButtonWidget(
                        label: 'Settings',
                        icon: Icons.settings_outlined,
                        onTap: () {},
                      ),
                      ProfileButtonWidget(
                        label: 'Helps & FAQs',
                        icon: Icons.help_outline,
                        onTap: () {},
                      ),
                      ProfileButtonWidget(
                        label: 'Sign Out',
                        icon: Icons.logout,
                        onTap: () {
                          FirebaseAuth.instance.signOut().then((val) {
                        Get.offAll(const SigininScreen());
                      });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class ProfileButtonWidget extends StatelessWidget {
  ProfileButtonWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  String label;
  IconData icon;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 8,
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
