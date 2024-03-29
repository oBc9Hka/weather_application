import 'package:flutter/material.dart';
import 'package:weather_application/ui/widgets/custom_text_button.dart';
import 'package:weather_application/ui/widgets/today_page_widgets/city_section.dart';
import 'package:weather_application/ui/widgets/today_page_widgets/icons_section.dart';

import '../models/forecast.dart';

class TodayPageWide extends StatelessWidget {
  const TodayPageWide({
    Key? key,
    required this.city,
    required this.currentWeather,
    required this.onSharePressed,
  }) : super(key: key);

  final City city;
  final ListElement currentWeather;
  final Function onSharePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CitySection(city: city, currentWeather: currentWeather),
          ],
        ),
        VerticalDivider(
          thickness: 2,
          indent: MediaQuery.of(context).size.height * 0.1,
          endIndent: MediaQuery.of(context).size.height * 0.1,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconsSection(currentWeather: currentWeather),
            CustomTextButton(
              title: 'Share',
              onPressed: onSharePressed,
            ),
          ],
        ),
      ],
    );
  }
}
