// ignore_for_file: prefer_const_constructors

import 'package:club_for_me/Features/Dashboard/clubs/view/clubs_screen.dart';
import 'package:flutter/material.dart';

class SearchEvents extends StatelessWidget {
  const SearchEvents({super.key});

  void _showRoundedBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.all(16.0),
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Filter',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Event Type',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, // Enable horizontal scrolling
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: ChoiceChip(
                          label: Text(
                            'Night Party',
                          ),
                          selectedColor: Colors.black,
                          checkmarkColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.white),
                          selected: true,
                        ),
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text('Silent Party'),
                        selected: false,
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text('After Party'),
                        selected: false,
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text('Dinner Show'),
                        selected: false,
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text('Rock'),
                        selected: false,
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text('Karoake'),
                        selected: false,
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text('Pop'),
                        selected: false,
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text('Latin'),
                        selected: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Music Genre',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, // Enable horizontal scrolling
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: ChoiceChip(
                          label: Text(
                            'Techno / Tech House',
                          ),
                          selectedColor: Colors.black,
                          checkmarkColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.white),
                          selected: true,
                        ),
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text('Revival'),
                        selected: false,
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text('Trap / Hip-Hop'),
                        selected: false,
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text('Jazz'),
                        selected: false,
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text('Rock'),
                        selected: false,
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text('Karoake'),
                        selected: false,
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text('Pop'),
                        selected: false,
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text('Latin'),
                        selected: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Time & Date',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: ChoiceChip(
                          label: Text(
                            'Today',
                          ),
                          selected: false,
                        ),
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text('Tomorrow'),
                        selectedColor: Colors.black,
                        checkmarkColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.white),
                        selected: true,
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text('This Week'),
                        selected: false,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        _showRoundedBottomSheet(context);
                      },
                      child: const Icon(
                        Icons.filter_alt,
                      ),
                    ),
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Recommendations for you'),
                  InkWell(
                    onTap: () {},
                    child: const Text('See All'),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  HomeGridItem(
                    image: 'assets/images/Onboarding1/ob1-c1-i1.jpeg',
                    title: 'Dance party at the top of the town - 2022',
                    location: 'New York',
                    isFullWidth: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  HomeGridItem(
                    image: 'assets/images/Onboarding1/ob1-c1-i2.jpeg',
                    title: 'Dance party at the top of the town - 2022',
                    location: 'New York',
                    isFullWidth: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  HomeGridItem(
                    image: 'assets/images/Onboarding1/ob1-c2-i1.jpeg',
                    title: 'Dance party at the top of the town - 2022',
                    location: 'New York',
                    isFullWidth: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  HomeGridItem(
                    image: 'assets/images/Onboarding1/ob1-c2-i2.jpeg',
                    title: 'Dance party at the top of the town - 2022',
                    location: 'New York',
                    isFullWidth: true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
