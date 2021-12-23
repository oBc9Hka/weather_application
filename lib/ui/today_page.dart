import 'package:flutter/material.dart';
import 'package:weather_application/ui/widgets/custom_text_button.dart';
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
        CitySection(
          city: city,
          currentWeather: currentWeather,
        ),
        Divider(
          thickness: 2,
          indent: MediaQuery.of(context).size.width * 0.3,
          endIndent: MediaQuery.of(context).size.width * 0.3,
        ),
        IconsSection(currentWeather: currentWeather),
        Divider(
          thickness: 2,
          indent: MediaQuery.of(context).size.width * 0.3,
          endIndent: MediaQuery.of(context).size.width * 0.3,
        ),
        CustomTextButton(title: 'Share', onPressed: onSharePressed),
      ],
    );
  }
}
