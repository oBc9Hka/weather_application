import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../../models/forecast.dart';
import '../indicator.dart';

class IconsSection extends StatelessWidget {
  const IconsSection({Key? key, required this.currentWeather}) : super(key: key);
  final ListElement currentWeather;

  @override
  Widget build(BuildContext context) {
    String _getWayByDegrees(int degree) {
      var value = (degree / 45).round();
      var arr = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"];
      return arr[(value % 8)];
    }

    IconData _getIconByDegrees(int degree) {
      var value = (degree / 45).round();
      var arr = [
        WeatherIcons.wind_deg_180,
        WeatherIcons.wind_deg_225,
        WeatherIcons.wind_deg_270,
        WeatherIcons.wind_deg_315,
        WeatherIcons.wind_deg_0,
        WeatherIcons.wind_deg_45,
        WeatherIcons.wind_deg_90,
        WeatherIcons.wind_deg_135,
      ];
      return arr[(value % 8)];
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconIndicator(
              icon: WeatherIcons.rain,
              title: '${currentWeather.main.humidity}%',
            ),
            IconIndicator(
              icon: WeatherIcons.raindrop,
              title: currentWeather.weather.first.main == 'Snow'
                  ? '${currentWeather.snow?.the3H ?? 0.0} mm'
                  : '${currentWeather.rain?.the3H ?? 0.0} mm',
            ),
            IconIndicator(
              icon: WeatherIcons.celsius,
              title: '${currentWeather.main.pressure} hPa',
            ),
          ],
        ),
        // const Padding(padding: EdgeInsets.only(top: 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconIndicator(
              icon: WeatherIcons.strong_wind,
              title: '${(currentWeather.wind.speed / 3.6).round()} km/h',
            ),
            IconIndicator(
              icon: _getIconByDegrees(currentWeather.wind.deg),
              title: _getWayByDegrees(currentWeather.wind.deg),
            ),
          ],
        ),
      ],
    );
  }
}
