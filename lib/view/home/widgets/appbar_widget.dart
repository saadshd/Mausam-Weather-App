import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:weather_app/view_model/controller/global_controller.dart';


class AppbarWidget extends StatefulWidget {
  const AppbarWidget({super.key});

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {

  String city = '';
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);


  @override
  void initState() {
    getAddress(
      globalController.getLatitude().value,
      globalController.getLongitude().value
    );
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Column(
            children: [
              Text(city,
              style: mediumTextStyle
              ),
              Text(Utils.date,
                style: lightTitleTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
