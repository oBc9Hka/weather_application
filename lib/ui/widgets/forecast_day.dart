import 'package:flutter/material.dart';
import 'package:weather_application/models/forecast.dart';
import 'package:weather_application/ui/widgets/icon_by_description.dart';

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
      if (DateTime.now().weekday == dayNumber) {
        return 'Today';
      }
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: Text(
            _getDayByNumber(weekday),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
        ),
        if (_getDayByNumber(weekday) != 'Today')
          const Divider(
            thickness: 2,
          ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  border: _getDayByNumber(weekday) == 'Today' &&
                          list[index] == list.first
                      ? Border.all(color: Colors.blue, width: 2)
                      : null),
              child: ForecastTile(
                icon: IconByDescription(
                  weatherID: list[index].weather.first.id,
                  date: list[index].dtTxt,
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
            return _getDayByNumber(weekday) != 'Today'
                ? Divider(
                    thickness: 2,
                    indent: MediaQuery.of(context).size.width * 0.25,
                  )
                : const SizedBox.shrink();
          },
        ),
        if (_getDayByNumber(weekday) != 'Today' && list.length != 1)
          const Divider(
            thickness: 2,
          ),
      ],
    );
  }
}
