import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/res/images/image_assets.dart';
import 'package:weather_app/view/home/widgets/components/frosted_container.dart';
import 'package:weather_app/view/home/widgets/components/horizontal_container.dart';
import 'package:weather_app/view/home/widgets/components/info_row.dart';
import 'package:weather_app/view/home/widgets/components/vertical_container.dart';
import 'package:weather_app/view_model/controller/global_controller.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController = Get.put(GlobalController());

    return Obx(
      () => Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: VerticalContainer(
                        label: 'Sunrise',
                        value: globalController.sunriseTime(),
                        imagePath: ImageAssets.sunrise,
                      ),
                    ),
                    Expanded(
                      child: VerticalContainer(
                        label: 'Sunset',
                        value: globalController.sunsetTime(),
                        imagePath: ImageAssets.sunset,
                      ),
                    ),
                  ],
                ),
                HorizontalContainer(
                  label: globalController.windDirection(),
                  value: globalController.windSpeed(),
                  imagePath: ImageAssets.wind,
                ),
              ],
            ),
          ),
          Expanded(
            child: FrostedContainer(
              height: 170,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    InfoRow(
                      label: 'Real Feel',
                      value: '${globalController.feelsLike()} °C',
                    ),
                    InfoRow(
                      label: 'Pressure',
                      value: globalController.pressure(),
                    ),
                    InfoRow(
                      label: 'Humidity',
                      value: globalController.humidity(),
                    ),
                    InfoRow(
                      label: 'Visibility',
                      value: globalController.visibility(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
