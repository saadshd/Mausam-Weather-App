import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/network/api_services.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/utils/utils.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;
  final Rx<WeatherModel?> _weatherData = Rx<WeatherModel?>(null);


  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => latitude;
  RxDouble getLongitude() => longitude;
  Rx<WeatherModel?> getWeatherModel() => _weatherData;

  WeatherModel? weatherDataValue() => _weatherData.value;
  String weatherDescription() => weatherDataValue()!.weather![0].description!.toUpperCase().toString();
  String weatherIconCode() => weatherDataValue()!.weather![0].icon.toString()  ;
  String currentTemperature() => weatherDataValue()!.main!.temp!.round().toString() ;
  String minTemperature() => weatherDataValue()!.main!.tempMin!.round().toString();
  String maxTemperature() => weatherDataValue()!.main!.tempMax!.round().toString();
  String pressure() => '${weatherDataValue()!.main!.pressure.toString()} hPa';
  String humidity() => '${weatherDataValue()!.main!.humidity.toString()} %';
  String visibility() => Utils.convertVisibility(weatherDataValue()!.visibility.toString());
  String sunriseTime() => Utils.convertTimestampToTime(weatherDataValue()!.sys!.sunrise.toString());
  String sunsetTime() => Utils.convertTimestampToTime(weatherDataValue()!.sys!.sunset.toString());
  String windSpeed() => Utils.convertSpeed(weatherDataValue()!.wind!.speed.toString());
  String windDirection() => Utils.getWindDirection(weatherDataValue()!.wind!.deg.toString());
  String feelsLike() => weatherDataValue()!.main!.feelsLike!.round().toString();
  String dtValue() => Utils.convertDtToTime(weatherDataValue()!.dt.toString());

  @override
  void onInit() {
    super.onInit();
    if (_isLoading.isTrue) {
      getLocationAndFetchWeather();
    }
  }

  Future<void> getLocationAndFetchWeather() async {
    try {
      await getLocation();
      await getWeather();
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> getLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar('Location', 'Location permissions are denied',
            snackPosition: SnackPosition.BOTTOM,
          );
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best).then((value) {
        latitude.value = value.latitude;
        longitude.value = value.longitude;
        _isLoading.value = false;
      });
    } catch (e){
      print('Error getting location: $e');
    }
  }

  Future<void> getWeather() async {
    try {
      final weatherData = await ApiServices().getWeatherApi(
        latitude.value,
        longitude.value,
      );

      _weatherData.value = WeatherModel.fromJson(weatherData);
    } catch (e) {
      print('Error fetching weather data: $e');
    } finally {
      _isLoading.value = false;
    }
  }
}

