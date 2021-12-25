import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_application/constants.dart';
import 'package:weather_application/ui/widgets/custom_flutter_app_icons.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../../models/forecast.dart';
import '../icon_indicator.dart';

class IconsSection extends StatelessWidget {
  const IconsSection({Key? key, required this.currentWeather})
      : super(key: key);
  final ListElement currentWeather;

  @override
  Widget build(BuildContext context) {
    String _getWayByDegrees(int degree) {
      var value = (degree / 45).round();
      var arr = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"];
      return arr[(value % 8)];
    }

    double _getAngleByDegrees(int degree){
      var value = (degree / 45).round();
      var const45deg = 3.14 / 4;
      var arr = [
        -const45deg,
        0.0,
        const45deg,
        2*const45deg,
        3*const45deg,
        4*const45deg,
        5*const45deg,
        6*const45deg,
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
              icon: CustomIcons.rain,
              title: '${currentWeather.main.humidity}%',
            ),
            IconIndicator(
              icon: CustomIcons.snow,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconIndicator(
              icon: CustomIcons.wind_1,
              title: '${(currentWeather.wind.speed / 3.6).round()} km/h',
            ),
            CompassIconIndicator(
              icon: Transform.rotate(
                angle: _getAngleByDegrees(currentWeather.wind.deg),
                child: Icon(
                  CustomIcons.compass,
                  color: Constants.iconsColor,
                  size: MediaQuery.of(context).size.height >
                          MediaQuery.of(context).size.width
                      ? MediaQuery.of(context).size.height * 0.04
                      : MediaQuery.of(context).size.width * 0.04,
                ),
              ),
              title: _getWayByDegrees(currentWeather.wind.deg),
            ),
          ],
        ),
      ],
    );
  }
}
