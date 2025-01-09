import 'dart:io';
import 'package:club_for_me/Features/Authentication/signin/view/siginin_screen.dart';
import 'package:club_for_me/Features/Dashboard/events/controller/events_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventsController = Get.find<EventsController>();

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
              Obx(
                () => EventTextField(
                  label: 'Start Date',
                  hintText: 'Select Start Date',
                  icon: Icons.timer_outlined,
                  controller: eventsController.startDateController.value,
                  isReadOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      helpText: 'Pick a Date',
                      cancelText: 'Cancel',
                      confirmText: 'OK',
                    );
                    if (pickedDate != null) {
                      eventsController.startDateController.value.text =
                          '${pickedDate.day}-${pickedDate.month}-${pickedDate.year}';
                    }
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => EventTextField(
                        label: 'Start time',
                        hintText: 'Select Start time',
                        icon: Icons.timer_outlined,
                        controller: eventsController.startTimeController.value,
                        isReadOnly: true,
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            helpText: 'Pick a Time',
                            cancelText: 'Cancel',
                            confirmText: 'OK',
                          );
                          if (pickedTime != null) {
                            final now = DateTime.now();
                            final pickedDateTime = DateTime(
                              now.year,
                              now.month,
                              now.day,
                              pickedTime.hour,
                              pickedTime.minute,
                            );

                            eventsController.startTimeController.value.text =
                                DateFormat('hh:mm a').format(pickedDateTime);
                          }
                        },
                      ),
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
              Obx(
                () => EventTextField(
                  label: 'End time',
                  hintText: 'Select End time',
                  icon: Icons.timer_outlined,
                  controller: eventsController.endTimeController.value,
                  isReadOnly: true,
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      helpText: 'Pick a Time',
                      cancelText: 'Cancel',
                      confirmText: 'OK',
                    );
                    if (pickedTime != null) {
                      final now = DateTime.now();
                      final pickedDateTime = DateTime(
                        now.year,
                        now.month,
                        now.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );

                      eventsController.endTimeController.value.text =
                          DateFormat('hh:mm a').format(pickedDateTime);
                    }
                  },
                ),
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
                      controller:
                          eventsController.eventDescriptionController.value,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Add Event Images'),
                    const SizedBox(
                      height: 12,
                    ),
                    Obx(
                      () => eventsController.imagesList.isEmpty
                          ? const Center(
                              child: Text(
                              'No Images Yet',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ))
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Obx(
                                () => Row(
                                    children: eventsController.imagesList
                                        .map((e) => Stack(
                                              alignment: Alignment.topRight,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      image: DecorationImage(
                                                        image: FileImage(
                                                          File(e),
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    eventsController.imagesList
                                                        .remove(e);
                                                  },
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 5),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          20,
                                                        )),
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                        size: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))
                                        .toList()),
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () async {
                        ImagePicker picker = ImagePicker();
                        XFile? pickedImage =
                            await picker.pickImage(source: ImageSource.gallery);

                        if (pickedImage != null) {
                          eventsController.imagesList.add(pickedImage.path);
                        }
                      },
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
    this.onTap,
    this.isReadOnly = false,
  });

  final String? label;
  final String? hintText;
  final IconData? icon;
  final TextEditingController controller;
  final void Function()? onTap;
  final bool isReadOnly;

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
            readOnly: isReadOnly,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              suffixIcon: icon != null ? Icon(icon) : null,
            ),
            onTap: onTap,
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
