import 'package:club_for_me/Data/remote/events_repo.dart';
import 'package:club_for_me/Features/Authentication/signin/view/siginin_screen.dart';
import 'package:club_for_me/Features/Dashboard/events/controller/events_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventsController =
        Get.put(EventsController(repository: EventsRepository()));

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Create New Event'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: eventsController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EventTextField(
                label: 'Event Name',
                hintText: 'Enter Event Name',
                controller: eventsController.eventNameController.value,
              ),
              const Divider(
                height: 20,
              ),
              EventTextField(
                label: 'Select a venue',
                hintText: 'Search for a venue',
                controller: eventsController.venueController.value,
              ),
              const ListTile(
                leading: Icon(Icons.add_rounded),
                title: Text('Add Manually'),
              ),
              const Divider(
                height: 20,
              ),
              EventTextField(
                label: 'Event Repeat',
                hintText: 'Select Event Type',
                icon: Icons.keyboard_arrow_down,
                controller: eventsController.eventRepeatController.value,
              ),
              EventTextField(
                label: 'Start Date',
                hintText: 'Select Start Date',
                icon: Icons.calendar_month_outlined,
                controller: eventsController.startDateController.value,
              ),
              Row(
                children: [
                  Expanded(
                    child: EventTextField(
                      label: 'Start time',
                      hintText: 'Select Start time',
                      icon: Icons.timer_outlined,
                      controller: eventsController.startTimeController.value,
                    ),
                  ),
                  Expanded(
                    child: EventTextField(
                      label: 'Duration',
                      hintText: 'Select Duration',
                      icon: Icons.keyboard_arrow_down,
                      controller: eventsController.durationController.value,
                    ),
                  ),
                ],
              ),
              EventTextField(
                label: 'End time',
                hintText: 'Select End time',
                icon: Icons.timer_outlined,
                controller: eventsController.endTimeController.value,
              ),
              const Divider(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Please describe your Event'),
                    TextFormField(
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    const Text('Add Event Images'),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(border: Border.all()),
                        child: const Center(child: Text('Add Image')),
                      ),
                    ),
                    RoundedButtonWithIcon(
                      buttonLabel: 'CREATE',
                      icon: Icons.arrow_forward,
                      onTap: () {
                        eventsController.addEvent();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class EventTextField extends StatelessWidget {
  const EventTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.icon,
    required this.controller,
  });

  final String? label;
  final String? hintText;
  final IconData? icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toString(),
            style: const TextStyle(fontSize: 14),
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              suffixIcon: icon != null ? Icon(icon) : null,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Field can't be empty!";
              } else {
                return null;
              }
            },
          )
        ],
      ),
    );
  }
}
