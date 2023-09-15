import 'package:weather_app/res/app_url/api_key.dart';

String weatherAppUrl(var lat, var lon) {
  String url;

  url =
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
  return url;
}
