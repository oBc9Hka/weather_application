import 'package:weather_application/models/forecast.dart';
import 'package:weather_application/services/forecast_service.dart';

class ForecastRepository {
  final ForecastService _forecastService = ForecastService();

  Future<Forecast> getForecast({required double lat, required double lon}) =>
      _forecastService.fetchForecast(lat: lat, lon: lon);
}
