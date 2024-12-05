import 'package:club_for_me/Common/widgets/NextButton.dart';
import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: screenHeight * 0.3,
          child: Image.asset(
            fit: BoxFit.cover,
            'assets/images/event_detail.png',
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Going to a Rock Concert',
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
                  title: const Text('14 December, 2024',style: TextStyle(fontSize: 62),),
                  subtitle: const Text('Tuesday, 4:00PM - 9:00PM',style: TextStyle(fontSize: 12),),
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
                  title: const Text('Gala Convention Center'),
                  subtitle: const Text('36 Guild Street London, UK '),
                ),
                const Padding(
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
                        'Enjoy your favorite dishe and a lovely your friends and family and have a Read More...',
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
                          Text(
                            'View All',
                            style: TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.underline,
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
                    children: [
                      GalleryImageWidget(
                        image: 'assets/images/Onboarding1/ob1-c1-i1.jpeg',
                      ),
                      GalleryImageWidget(
                        image: 'assets/images/Onboarding1/ob1-c1-i2.jpeg',
                      ),
                      GalleryImageWidget(
                        image: 'assets/images/Onboarding1/ob1-c2-i1.jpeg',
                      ),
                      GalleryImageWidget(
                        image: 'assets/images/Onboarding1/ob1-c2-i2.jpeg',
                      ),
                      GalleryImageWidget(
                        image: 'assets/images/Onboarding1/ob1-c3-i1.jpeg',
                      ),
                      GalleryImageWidget(
                        image: 'assets/images/Onboarding1/ob1-c3-i2.jpeg',
                      ),
                    ],
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
    return Container(
      margin: const EdgeInsets.only(left: 16),
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            image,
          ),
        ),
      ),
    );
  }
}
