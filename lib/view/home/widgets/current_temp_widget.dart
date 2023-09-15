import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/view_model/controller/global_controller.dart';

class CurrentTempWidget extends StatelessWidget {
  const CurrentTempWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController = Get.put(GlobalController());

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .6,
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/weather/${globalController.weatherIconCode()}.png',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  globalController.currentTemperature(),
                  style: largeTextStyle,
                ),
                Text(
                  '°C',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
            Text(
              globalController.weatherDescription(),
              style: titleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
