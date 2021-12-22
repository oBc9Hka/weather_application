import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/bloc/forecast_event.dart';
import 'package:weather_application/bloc/forecast_state.dart';
import 'package:weather_application/services/forecast_repository.dart';

import '../models/forecast.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final ForecastRepository forecastRepository;

  ForecastBloc(this.forecastRepository) : super(ForecastEmptyState()) {
    on<ForecastRequested>((event, emit) async {
      emit(ForecastLoadingState());
      try {
        final Forecast _loadedForecastList = await forecastRepository.getForecast();

        emit(ForecastLoadedState(loadedForecast: _loadedForecastList));
      } catch (e) {
        emit(ForecastErrorState());
      }
    });
  }
}
