import 'package:club_for_me/Common/widgets/NextButton.dart';
import 'package:club_for_me/Features/Dashboard/events/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({
    super.key,
    required this.event,
  });
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: screenHeight * 0.3,
          child: Image.network(
            '${event.images![0]}',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            title: const Text(
              'Event Details',
              style: TextStyle(color: Colors.white),
            ),
            actions: const [
              Icon(Icons.share),
              SizedBox(
                width: 8,
              ),
              Icon(Icons.save),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: screenWidth * 0.8,
                    margin: EdgeInsets.only(
                      top: screenHeight * 0.15,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Hello'),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              minimumSize: const Size(80, 30)),
                          child: const Text(
                            'Invite',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    event.eventName.toString(),
                    style: TextStyle(fontSize: 28),
                  ),
                ),
                ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.calendar_month,
                    ),
                  ),
                  title: Text(
                    DateFormat('dd MMMM, yyyy').format(event.startDate!),
                  ),
                  subtitle: Text(
                    '${DateFormat('EEE').format(event.startDate!)}, ${DateFormat('hh:mmaa').format(event.startTime!)} - ${DateFormat('hh:mmaa').format(event.endTime!)}',
                  ),
                ),
                ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.location_pin,
                    ),
                  ),
                  title: Text(event.venue.toString()),
                  subtitle: const Text(''),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Event',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        event.description.toString(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Event Gallery',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Event Gallery'),
                                          IconButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon: Icon(Icons.close))
                                        ],
                                      ),
                                      content: GridView.builder(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  mainAxisSpacing: 5,
                                                  crossAxisSpacing: 5),
                                          itemCount: event.images!.length,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text('Preview'),
                                                            IconButton(
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                                icon: Icon(Icons
                                                                    .close))
                                                          ],
                                                        ),
                                                        content: Image.network(
                                                            event.images![
                                                                index]),
                                                      );
                                                    });
                                              },
                                              child: SizedBox(
                                                width: 200,
                                                height: 200,
                                                child: Image.network(
                                                    fit: BoxFit.cover,
                                                    event.images![index]),
                                              ),
                                            );
                                          }),
                                    );
                                  });
                            },
                            child: const Text(
                              'View All',
                              style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: event.images!
                        .map(
                          (e) => GalleryImageWidget(
                            image: e,
                          ),
                        )
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Venu & Location',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: screenWidth,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/map.png')),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      NextButton(
                        buttonLabel: 'ADD TO FAVORITE',
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class GalleryImageWidget extends StatelessWidget {
  GalleryImageWidget({
    super.key,
    required this.image,
  });

  String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Preview'),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.close))
                  ],
                ),
                content: Image.network(image),
              );
            });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        width: 68,
        height: 68,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              image,
            ),
          ),
        ),
      ),
    );
  }
}
