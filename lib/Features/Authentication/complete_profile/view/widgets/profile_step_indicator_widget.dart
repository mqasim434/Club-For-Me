import 'package:flutter/material.dart';

class ProfileStepIndicator extends StatelessWidget {
  ProfileStepIndicator({
    super.key,
    required this.step,
  });

  int? step;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          height: 4,
          decoration: BoxDecoration(
            color: step == 1 ? Colors.black : const Color(0xffEAE7E7),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          height: 4,
          decoration: BoxDecoration(
            color: step == 2 ? Colors.black : const Color(0xffEAE7E7),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          height: 4,
          decoration: BoxDecoration(
            color: step == 3 ? Colors.black : const Color(0xffEAE7E7),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          height: 4,
          decoration: BoxDecoration(
            color: step == 4 ? Colors.black : const Color(0xffEAE7E7),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          height: 4,
          decoration: BoxDecoration(
            color: step == 5 ? Colors.black : const Color(0xffEAE7E7),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
      ],
    );
  }
}
