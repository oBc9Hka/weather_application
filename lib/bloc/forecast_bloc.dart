import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_application/bloc/forecast_event.dart';
import 'package:weather_application/bloc/forecast_state.dart';
import 'package:weather_application/services/forecast_repository.dart';
import 'package:weather_application/services/geolocation_repository.dart';

import '../models/forecast.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final ForecastRepository forecastRepository;
  final GeolocationRepository geolocationRepository;

  ForecastBloc(this.forecastRepository, this.geolocationRepository)
      : super(ForecastEmptyState()) {
    on<ForecastRequestedEvent>((event, emit) async {
      emit(ForecastGettingGeolocationState());
      try {
        final Position _position = await geolocationRepository.getPosition();
        emit(ForecastLoadingState());

        try {
          final Forecast _loadedForecastList =
              await forecastRepository.getForecast(
            lat: _position.latitude,
            lon: _position.longitude,
          );

          emit(ForecastLoadedState(loadedForecast: _loadedForecastList));
        } catch (_) {
          emit(ForecastErrorState());
        }
      } catch (_) {
        emit(ForecastGeolocationErrorState());
      }
    });
  }
}
