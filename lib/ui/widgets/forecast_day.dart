import 'package:flutter/material.dart';
import 'package:weather_application/models/forecast.dart';
import 'package:weather_application/ui/widgets/icon_by_id.dart';

import 'forecast_tile.dart';

class ForecastDay extends StatelessWidget {
  const ForecastDay({
    Key? key,
    required this.weekday,
    required this.list,
  }) : super(key: key);
  final int weekday;
  final List<ListElement> list;

  @override
  Widget build(BuildContext context) {
    String _getDayByNumber(int dayNumber) {
      switch (dayNumber) {
        case 1:
          return 'Monday';
        case 2:
          return 'Tuesday';
        case 3:
          return 'Wednesday';
        case 4:
          return 'Thursday';
        case 5:
          return 'Friday';
        case 6:
          return 'Saturday';
        case 7:
          return 'Sunday';
        default:
          return 'Monday';
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: Text(
            _getDayByNumber(weekday).toUpperCase(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        const Divider(),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ForecastTile(
              icon: IconById(
                weatherID: list[index].weather.first.id,
                sys: list[index].sys,
                color: Colors.orangeAccent,
                size: 45,
              ),
              time: list[index].dtTxt.hour.toString().length < 2
                  ? '0${list[index].dtTxt.hour}:00'
                  : '${list[index].dtTxt.hour}:00',
              weatherState: list[index].weather[0].description.toCapitalized(),
              temperature: list[index].main.temp.toString(),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const CustomDivider();
          },
        ),
        const Divider(),
      ],
    );
  }
}

class ForecastDayToday extends StatelessWidget {
  const ForecastDayToday({Key? key, required this.list}) : super(key: key);
  final List<ListElement> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: Text(
            'TODAY',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  border: list.first == list[index]
                      ? Border.all(color: Colors.blue, width: 3)
                      : null),
              child: ForecastTile(
                icon: IconById(
                  weatherID: list[index].weather.first.id,
                  sys: list[index].sys,
                  color: Colors.orangeAccent,
                  size: 50,
                ),
                time: list[index].dtTxt.hour.toString().length < 2
                    ? '0${list[index].dtTxt.hour}:00'
                    : '${list[index].dtTxt.hour}:00',
                weatherState:
                    list[index].weather[0].description.toCapitalized(),
                temperature: list[index].main.temp.toString(),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            if (index != 0) {
              return const CustomDivider();
            }
            return const SizedBox.shrink();
          },
        ),
        if (list.length != 1) const Divider(),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(flex: 4, child: SizedBox.shrink()),
        Expanded(
          flex: 9,
          child: Divider(),
        ),
      ],
    );
  }
}
