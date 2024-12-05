import 'package:club_for_me/Common/widgets/NextButton.dart';
import 'package:club_for_me/Features/Dashboard/clubs/view/clubs_screen.dart';
import 'package:flutter/material.dart';

class ClubDetailsScreen extends StatelessWidget {
  const ClubDetailsScreen({super.key});

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
            'assets/images/club.jpeg',
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
              'Club Details',
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
                    'Jackie O Club',
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
                      Icons.location_pin,
                    ),
                  ),
                  title: const Text(
                    'Gala Convention Center',
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: const Text(
                    '36 Guild Street London, UK ',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Club',
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
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Upcoming Events on Jackie O',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: HomeGridItem(
                        image: 'assets/images/Home/grid-item-1.jpeg',
                        title: 'Dance party at the top of the town - 2022',
                        location: 'New York',
                        isFullWidth: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: HomeGridItem(
                        image: 'assets/images/Home/grid-item-2.jpeg',
                        title: 'Festival event at kudasan - 2022',
                        location: 'California',
                        isFullWidth: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: HomeGridItem(
                        image: 'assets/images/Home/grid-item-3.jpeg',
                        title: 'Party with friends at night - 2022',
                        location: 'Miami',
                        isFullWidth: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: HomeGridItem(
                        image: 'assets/images/Home/grid-item-4.jpeg',
                        title: 'Satellite mega festival - 2022',
                        location: 'California',
                        isFullWidth: true,
                      ),
                    ),
                  ],
                )
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
