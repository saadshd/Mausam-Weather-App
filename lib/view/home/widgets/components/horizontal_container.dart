import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/view/home/widgets/components/frosted_container.dart';

class HorizontalContainer extends StatelessWidget {
  final String label, value;
  final String imagePath;

  const HorizontalContainer(
      {super.key,
      required this.label,
      required this.value,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return FrostedContainer(
      height: 65,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
            Column(
              children: [
                Text(
                  label,
                  style: lightTitleTextStyle,
                ),
                Text(
                  value,
                  style: titleTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
