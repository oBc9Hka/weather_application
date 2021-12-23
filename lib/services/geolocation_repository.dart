import 'package:geolocator/geolocator.dart';
import 'package:weather_application/services/geolocation_service.dart';

class GeolocationRepository {
  final GeolocationService _geolocationService = GeolocationService();

  Future<Position> getPosition() => _geolocationService.determinePosition();
}
