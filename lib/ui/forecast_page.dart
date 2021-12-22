import 'package:flutter/material.dart';
import 'package:weather_application/ui/widgets/forecast_day.dart';

import '../models/forecast.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({
    Key? key,
    required this.forecast,
    required this.forecastList,
  }) : super(key: key);
  final Forecast forecast;
  final List<List<ListElement>> forecastList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: forecastList.length,
      itemBuilder: (context, index) {
        return ForecastDay(
          weekday: forecastList[index].first.dtTxt.weekday,
          list: forecastList[index],
          // tiles: tiles
        );
      },
    );
  }
}
