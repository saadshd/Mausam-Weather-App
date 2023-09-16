import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants.dart';

class InfoRow extends StatelessWidget {
  final String label, value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Divider(
            height: 10,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
