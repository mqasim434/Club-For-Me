import 'dart:convert';
import 'package:club_for_me/Common/widgets/NextButton.dart';
import 'package:club_for_me/Features/Authentication/complete_profile/view/widgets/profile_step_indicator_widget.dart';
import 'package:club_for_me/Features/Dashboard/dashboard.dart';
import 'package:club_for_me/Features/Dashboard/profile/controller/profile_controller.dart';
import 'package:club_for_me/Utils/constants/app_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChooseYourCityScreen extends StatefulWidget {
  const ChooseYourCityScreen({super.key});

  @override
  State<ChooseYourCityScreen> createState() => _ChooseYourCityScreenState();
}

class _ChooseYourCityScreenState extends State<ChooseYourCityScreen> {
  final TextEditingController _textController = TextEditingController();
  List<dynamic> _suggestions = [];
  String _apiKey = "AIzaSyCGXjH2olWHaRbJBH4SRNGmYfX60skyWs8";

  Future<void> _searchCity(String query) async {
    if (query.isEmpty || query == '') {
      setState(() {
        _suggestions.clear();
      });
      return;
    }

    final String url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=$_apiKey";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _suggestions = data['predictions'] ?? [];
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void _selectCity(String city) {
    _textController.text = city;
    setState(() {
      _suggestions.clear();
    });
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
                  'Get personalized event recommendation.',
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
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Pick Your City',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Image.asset(AppIcons.locationIcon),
                    suffixIcon: Image.asset(AppIcons.arrowDownIcon),
                  ),
                  onChanged: _searchCity,
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
                if (_suggestions.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _suggestions.length,
                      itemBuilder: (context, index) {
                        final suggestion = _suggestions[index];
                        return ListTile(
                          title: Text(suggestion['description']),
                          onTap: () => _selectCity(suggestion['description']),
                        );
                      },
                    ),
                  ),
              ],
            ),
            NextButton(
              buttonLabel: 'Next',
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  final profileController = Get.find<ProfileController>();
                  profileController
                      .updateUserField(FirebaseAuth.instance.currentUser!.uid, {
                    'city': _textController.text,
                  });
                  Get.to(() => const DashboardScreen());
                } else {
                  Get.showSnackbar(const GetSnackBar(
                    title: 'Empty Field',
                    message: 'No Location Selected',
                  ));
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}
