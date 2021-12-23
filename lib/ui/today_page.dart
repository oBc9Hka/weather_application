import 'package:flutter/material.dart';
import 'package:weather_application/ui/widgets/icon_by_id.dart';
import 'package:weather_application/ui/widgets/custom_text_button.dart';
import 'package:weather_application/ui/widgets/indicator.dart';
import 'package:weather_icons/weather_icons.dart';

import '../models/forecast.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({Key? key, required this.city, required this.currentWeather})
      : super(key: key);
  final City city;
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
    //TODO: width > height
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: IconById(
                  weatherID: currentWeather.weather.first.id,
                  date: currentWeather.dtTxt,
                  color: Colors.orangeAccent,
                  size: 70,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon((Icons.location_on_outlined)),
                  Text(
                    '${city.name}, ${city.country}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  '${currentWeather.main.temp}°C | ${currentWeather.weather.first.main}',
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2,
          indent: MediaQuery.of(context).size.width * 0.3,
          endIndent: MediaQuery.of(context).size.width * 0.3,
        ),
        Expanded(
          flex: 3,
          child: Column(
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
                        ? '${currentWeather.snow?.the3H ?? 0.0}'
                        : '${currentWeather.rain?.the3H ?? 0.0}',
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
          ),
        ),
        Divider(
          thickness: 2,
          indent: MediaQuery.of(context).size.width * 0.3,
          endIndent: MediaQuery.of(context).size.width * 0.3,
        )
        const CustomTextButton(title: 'Share'),
      ],
    );
  }
}
