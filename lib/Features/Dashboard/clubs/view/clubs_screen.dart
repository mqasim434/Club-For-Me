import 'package:club_for_me/Features/Authentication/signin/view/siginin_screen.dart';
import 'package:club_for_me/Features/Dashboard/clubs/view/all_clubs_screen.dart';
import 'package:club_for_me/Utils/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubsScreen extends StatelessWidget {
  const ClubsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                title: const Text('Location'),
                trailing: Icon(Icons.notification_add),
                subtitle: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                    ),
                    Text('Bangalore, India')
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child:
                    MyTextField(hintText: 'Search', prefixIconImage: AppIcons.locationIcon),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: ChoiceChip(
                        label: Text('Night Party'),
                        selected: true,
                        selectedColor: Colors.black,
                        labelStyle: TextStyle(color: Colors.white),
                        checkmarkColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      label: Text('Live/Concert'),
                      selected: true,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      label: Text('EDM'),
                      selected: true,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      label: Text('Jazz'),
                      selected: true,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      label: Text('Rock'),
                      selected: true,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      label: Text('Karoake'),
                      selected: true,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      label: Text('Pop'),
                      selected: true,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      label: Text('Latin'),
                      selected: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Nearby Clubs'),
                    InkWell(
                        onTap: () {
                          Get.to(() => const AllClubsScreen());
                        },
                        child: const Text('See All')),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: HomeGridItem(
                            image: 'assets/images/Home/grid-item-1.jpeg',
                            title: 'Jackie O',
                            location: 'New York',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: HomeGridItem(
                            image: 'assets/images/Home/grid-item-2.jpeg',
                            title: 'Qube dico club',
                            location: 'New York',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        HomeGridItem(
                          image: 'assets/images/Home/grid-item-3.jpeg',
                          title: 'Gala party with friends - 2023',
                          location: 'New York',
                        ),
                        HomeGridItem(
                          image: 'assets/images/Home/grid-item-4.jpeg',
                          title: 'Satellite mega festival - 2023',
                          location: 'New York',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Popular Clubs'),
                    InkWell(
                        onTap: () {
                          Get.to(() => const AllClubsScreen());
                        },
                        child: const Text('See All')),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: HomeCardWidget(
                        image: 'assets/images/Home/grid-item-1.jpeg',
                        title: 'Piccolo Mondo Disco',
                        dateTime: 'THU 26 May, 09:00 - FRI 27 May, 10:00',
                        price: '30.00',
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    HomeCardWidget(
                      image: 'assets/images/Home/grid-item-1.jpeg',
                      title: 'Friends Forever Party',
                      dateTime: 'THU 26 May, 09:00 - FRI 27 May, 10:00',
                      price: '30.00',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeCardWidget extends StatelessWidget {
  HomeCardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.dateTime,
    required this.price,
  });

  String image;
  String title;
  String dateTime;
  String price;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        width: screenWidth * 0.85,
        height: screenHeight * 0.35,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      image,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    dateTime,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/Home/grid-item-1.jpeg'),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xffAAAAAA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          '\$$price',
                          style: const TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ));
  }
}

class HomeGridItem extends StatelessWidget {
  HomeGridItem({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    this.isFullWidth = false,
  });

  String image;
  String title;
  String location;
  bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: isFullWidth ? screenWidth : screenWidth * 0.8,
      height: screenHeight * 0.13,
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    image,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                            ),
                            Text(
                              location,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xff8B8688),
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {},
                            child: const Text(
                              'Join',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
