import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../models/forecast.dart';

class IconById extends StatelessWidget {
  const IconById({
    Key? key,
    required this.weatherID,
    required this.sys,
    this.color,
    this.size,
  }) : super(key: key);

  final int weatherID;
  final Sys sys;
  final Color? color;
  final double? size;

  @override
  Icon build(BuildContext context) {
    IconData _getIconByWeather(int id, bool isDay) {
      switch (isDay) {
        case true:
          {
            if ([800].contains(id)) {
              return WeatherIcons.day_sunny;
            } else if ([801].contains(id)) {
              return WeatherIcons.day_cloudy;
            } else if ([802].contains(id)) {
              return WeatherIcons.day_cloudy_high;
            } else if ([803, 804].contains(id)) {
              return WeatherIcons.cloudy;
            } else if ([500, 501, 502, 503, 504].contains(id)) {
              return WeatherIcons.day_rain_mix;
            } else if ([511].contains(id)) {
              return WeatherIcons.snowflake_cold;
            } else if ([520, 521, 522, 531].contains(id)) {
              return WeatherIcons.rain_mix;
            } else if ([600, 601, 602, 611, 612, 613, 615, 616, 620, 621, 622]
                .contains(id)) {
              return WeatherIcons.snowflake_cold;
            } else if ([701, 711, 721, 731, 741, 751, 761, 762, 771, 781]
                .contains(id)) {
              return WeatherIcons.day_fog;
            } else if ([200, 201, 202, 210, 211, 212, 221, 230, 231, 232]
                .contains(id)) {
              return WeatherIcons.thunderstorm;
            }
            break;
          }
        case false:
          {
            if ([800].contains(id)) {
              return WeatherIcons.night_clear;
            } else if ([801].contains(id)) {
              return WeatherIcons.night_alt_cloudy;
            } else if ([802].contains(id)) {
              return WeatherIcons.night_alt_cloudy_high;
            } else if ([803, 804].contains(id)) {
              return WeatherIcons.night_alt_cloudy_high;
            } else if ([500, 501, 502, 503, 504].contains(id)) {
              return WeatherIcons.night_alt_rain_mix;
            } else if ([511].contains(id)) {
              return WeatherIcons.snowflake_cold;
            } else if ([520, 521, 522, 531].contains(id)) {
              return WeatherIcons.night_alt_rain_mix;
            } else if ([600, 601, 602, 611, 612, 613, 615, 616, 620, 621, 622]
                .contains(id)) {
              return WeatherIcons.snowflake_cold;
            } else if ([701, 711, 721, 731, 741, 751, 761, 762, 771, 781]
                .contains(id)) {
              return WeatherIcons.night_fog;
            } else if ([200, 201, 202, 210, 211, 212, 221, 230, 231, 232]
                .contains(id)) {
              return WeatherIcons.thunderstorm;
            }
            break;
          }
        default:
          {
            return WeatherIcons.day_sunny;
          }
      }
      return WeatherIcons.day_sunny;
    }

    return Icon(
      _getIconByWeather(weatherID, sys.pod == 'd'),
      color: color,
      size: size,
    );
  }
}
