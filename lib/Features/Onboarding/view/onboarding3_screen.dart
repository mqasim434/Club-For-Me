import 'package:club_for_me/Common/widgets/NextButton.dart';
import 'package:club_for_me/Features/Authentication/signin/view/siginin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding3Screen extends StatelessWidget {
  const Onboarding3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/Onboarding3/ob3-c1-i1.png',
                              ),
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/Onboarding3/ob3-c1-i2.png',
                              ),
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/Onboarding3/ob3-c2-i1.png',
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/Onboarding3/ob3-c2-i2.png',
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/Onboarding3/ob3-c3-i1.png',
                              ),
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/Onboarding3/ob3-c3-i2.png',
                              ),
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(
                            "Don't Miss Out on Exclusive Offers!",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Get notified about promotions, discounts, and\n last-minute deals for your favorite events\n and venues.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff8B8688),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 35,
                        height: 5,
                        decoration: BoxDecoration(
                          color: const Color(0x8B868833),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: const Color(0x8B868833),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NextButton(
                        buttonLabel: 'Next ',
                        onPressed: () {
                          Get.to(()=>SigininScreen());
                        },
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ))
        ],
      ),
    ));
  }
}
