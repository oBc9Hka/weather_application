import 'package:flutter/material.dart';
import 'package:weather_application/ui/widgets/forecast_day.dart';
import 'package:weather_application/ui/widgets/forecast_tile.dart';
import 'package:weather_icons/weather_icons.dart';

import '../models/forecast.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({Key? key, required this.forecast}) : super(key: key);
  final Forecast forecast;

  @override
  _ForecastPageState createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  // static const _todayTiles = [
  //   ForecastTile(
  //     icon: Icons.wb_sunny_outlined,
  //     time: '13:00',
  //     weatherState: 'Clean',
  //     temperature: '22',
  //   ),
  //   ForecastTile(
  //     icon: WeatherIcons.day_rain,
  //     time: '16:00',
  //     weatherState: 'Rain Showers',
  //     temperature: '18',
  //   ),
  //   ForecastTile(
  //     icon: WeatherIcons.night_alt_rain,
  //     time: '19:00',
  //     weatherState: 'Rain Showers',
  //     temperature: '15',
  //   ),
  //   ForecastTile(
  //     icon: WeatherIcons.night_alt_cloudy,
  //     time: '22:00',
  //     weatherState: 'Few Clouds',
  //     temperature: '10',
  //   ),
  // ];
  //
  // static const _fridayTiles = [
  //   ForecastTile(
  //     icon: WeatherIcons.night_clear,
  //     time: '01:00',
  //     weatherState: 'Clean',
  //     temperature: '8',
  //   ),
  //   ForecastTile(
  //     icon: WeatherIcons.night_clear,
  //     time: '04:00',
  //     weatherState: 'Clean',
  //     temperature: '7',
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    List<ListElement> forecastList = widget.forecast.list;
    return ListView.builder(
      itemCount: forecastList.length,
      itemBuilder: (context, index) {
        final forecastItem = forecastList[index];
        return ForecastTile(
          icon: WeatherIcons.day_sunny,
          iconPath: forecastItem.weather[0].icon,
          time: '${forecastItem.dtTxt.hour}:00',
          weatherState: forecastItem.weather[0].description.toCapitalized(),
          temperature: forecastItem.main.temp.toString(),
        );
      },
    );
    // return ListView(
    //   children: const [
    //     ForecastDay(
    //       dayName: 'Today',
    //       tiles: _todayTiles,
    //     ),
    //     ForecastDay(
    //       dayName: 'Friday',
    //       tiles: _fridayTiles,
    //     ),
    //   ],
    // );
  }
}
