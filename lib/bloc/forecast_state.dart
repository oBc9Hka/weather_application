import '../models/forecast.dart';

abstract class ForecastState {}

class ForecastEmptyState extends ForecastState {}

class ForecastLoadingState extends ForecastState {}

class ForecastLoadedState extends ForecastState {
  // List<Forecast> loadedForecast;
  Forecast loadedForecast;

  ForecastLoadedState({required this.loadedForecast})
      : assert(loadedForecast != null);
}

class ForecastErrorState extends ForecastState {}
