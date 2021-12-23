import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_application/models/forecast.dart';

// minsk id:  625144
// minsk geo: 53.900889, 27.562774
// https://api.openweathermap.org/data/2.5/forecast?lat=53.900889&lon=27.562774&appid=e58c5bb7a1593bcc9d47ac52d492b361&units=metric
class ForecastService {
  static const String _apiKey = "e58c5bb7a1593bcc9d47ac52d492b361";

  //TODO: fetch by geo
  Future<Forecast> fetchForecast({required double lat, required double lon}) async {
    var url =
        'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Map<String, dynamic> forecastJson = json.decode(response.body);
      return Forecast.fromJson(forecastJson);
    } else {
      throw Exception('Fetching data failed');
    }
  }
}
