import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageEventsScreen extends StatelessWidget {
  const ManageEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final manageEventsScreenController =
        Get.put(ManageEventsScreenController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Events',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: const Icon(Icons.more_vert),
            )
          ],
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xfff8f8f8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => InkWell(
                        onTap: () {
                          manageEventsScreenController.switchTab('Upcoming');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.38,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: manageEventsScreenController.selectedTab ==
                                    'Upcoming'
                                ? Colors.white
                                : Colors.transparent,
                          ),
                          child: const Center(child: Text('UPCOMING')),
                        ),
                      ),
                    ),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          manageEventsScreenController.switchTab('Past Events');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.38,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: manageEventsScreenController.selectedTab ==
                                    'Past Events'
                                ? Colors.white
                                : Colors.transparent,
                          ),
                          child: const Center(child: Text('PAST EVENTS')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      Icons.calendar_month,
                      color: Colors.red,
                      size: 200,
                    ),
                  ),
                  Text(
                    'No Upcoming Event',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet,\n consectetur ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Color(0xff747688)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ManageEventsScreenController extends GetxController {
  final RxString _selectedTab = 'Upcoming'.obs;

  String get selectedTab => _selectedTab.value;

  void switchTab(String tab) {
    _selectedTab.value = tab;
  }
}
