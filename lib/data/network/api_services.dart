import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/app_exceptions.dart';
import 'package:weather_app/data/network/base_api_services.dart';
import 'package:weather_app/res/app_url/app_url.dart';

class ApiServices extends BaseApiServices {
  @override
  Future getWeatherApi(lan, lon) async {
    var jsonData;
    try {
      var response = await http
          .get(Uri.parse(weatherAppUrl(lan, lon)))
          .timeout(const Duration(seconds: 20));
      jsonData = jsonResponse(response);
    } on SocketException {
      throw InternetException(
        'No Internet',
      );
    } on RequestTimeOut {
      throw RequestTimeOut(
        'Request Timeout',
      );
    }
    return jsonData;
  }

  dynamic jsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      default:
        throw FetchDataException(
          'Error while Communication ${response.statusCode}',
        );
    }
  }
}
