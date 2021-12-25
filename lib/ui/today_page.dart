import 'package:flutter/material.dart';
import 'package:weather_application/ui/widgets/custom_text_button.dart';
import 'package:weather_application/ui/widgets/dash_divider.dart';
import 'package:weather_application/ui/widgets/today_page_widgets/city_section.dart';
import 'package:weather_application/ui/widgets/today_page_widgets/icons_section.dart';

import '../models/forecast.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: CitySection(
            city: city,
            currentWeather: currentWeather,
          ),
        ),
        const DashDivider(),
        IconsSection(currentWeather: currentWeather),
        const DashDivider(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomTextButton(title: 'Share', onPressed: onSharePressed),
        ),
      ],
    );
  }
}
