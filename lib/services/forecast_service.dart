import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_application/models/forecast.dart';

//api.openweathermap.org/data/2.5/forecast?id=625144&appid=e58c5bb7a1593bcc9d47ac52d492b361&units=metric
class ForecastService {
  static const String _apiKey = "e58c5bb7a1593bcc9d47ac52d492b361";

  // Future<List<Forecast>> fetchForecast(
  //     {String lat = "", String lon = ""}) async {
  //   var url =
  //       'https://api.openweathermap.org/data/2.5/forecast?id=625144&appid=$_apiKey&units=metric';
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> forecastJson = json.decode(response.body);
  //     return forecastJson['list']
  //         .map<Forecast>((json) => Forecast.fromJson(json))
  //         .toList();
  //   } else {
  //     throw Exception('Fetching data failed');
  //   }
  // }

  Future<Forecast> fetchForecast(
      {String lat = "", String lon = ""}) async {
    var url =
        'https://api.openweathermap.org/data/2.5/forecast?id=625144&appid=$_apiKey&units=metric';
    //var url = 'https://api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid=$_apiKey&units=metric';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Map<String, dynamic> forecastJson = json.decode(response.body);
      return Forecast.fromJson(forecastJson);
    } else {
      throw Exception('Fetching data failed');
    }
  }
}

// 625144 minsk id
