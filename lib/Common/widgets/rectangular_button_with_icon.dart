import 'package:flutter/material.dart';

class RectangularButtonWithIcon extends StatelessWidget {
  const RectangularButtonWithIcon({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String? label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 50,
        color: Colors.black,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 50,
            ),
            Text(label.toString()),
            const CircleAvatar(
              child: Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
    );
  }
}
