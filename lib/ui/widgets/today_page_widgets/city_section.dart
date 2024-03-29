import 'package:dash_painter/dash_decoration.dart';
import 'package:flutter/material.dart';
import 'package:weather_application/constants.dart';

import '../../../models/forecast.dart';
import '../icon_by_id.dart';

class CitySection extends StatelessWidget {
  const CitySection(
      {Key? key, required this.city, required this.currentWeather})
      : super(key: key);

  final City city;
  final ListElement currentWeather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: IconById(
            weatherID: currentWeather.weather.first.id,
            sys: currentWeather.sys,
            color: Constants.iconsColor,
            size: 70,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                decoration: DashDecoration(
                  gradient: const SweepGradient(
                    colors: [
                      Colors.grey,
                      Colors.grey,
                    ],
                  ),
                ),
                child: const Icon((Icons.location_on_outlined)),
              ),
            ),
            Text(
              '${city.name}, ${city.country}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            '${currentWeather.main.temp}°C | ${currentWeather.weather.first.main}',
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.w300, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
