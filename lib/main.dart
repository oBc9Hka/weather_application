import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/bloc/forecast_bloc.dart';
import 'package:weather_application/services/forecast_repository.dart';
import 'package:weather_application/services/geolocation_repository.dart';
import 'package:weather_application/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forecastRepository = ForecastRepository();
    final geolocationRepository = GeolocationRepository();
    return BlocProvider<ForecastBloc>(
      create: (context) => ForecastBloc(
        forecastRepository,
        geolocationRepository,
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Avenir',
          dividerTheme: const DividerThemeData(
            space: 0,
          ),
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
