import 'package:flutter/material.dart';
import 'package:weather_application/ui/widgets/indicator.dart';
import 'package:weather_icons/weather_icons.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({Key? key}) : super(key: key);

  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const Icon(
              Icons.wb_sunny_outlined,
              size: 70,
              color: Colors.orangeAccent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon((Icons.location_on_outlined)),
                Text(
                  'London, UK',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                '22°C | Sunny',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    color: Colors.blue),
              ),
            ),
          ],
        ),
        Divider(
          thickness: 2,
          indent: MediaQuery.of(context).size.width * 0.3,
          endIndent: MediaQuery.of(context).size.width * 0.3,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: MediaQuery.of(context).size.width * 0.2,
          runSpacing: 20,
          children: const [
            IconIndicator(
              icon: WeatherIcons.rain,
              title: '57%',
            ),
            IconIndicator(
              icon: WeatherIcons.raindrop,
              title: '1.0 mm',
            ),
            IconIndicator(
              icon: WeatherIcons.celsius,
              title: '1019 hPa',
            ),
            IconIndicator(
              icon: WeatherIcons.strong_wind,
              title: '20 km/h',
            ),
            IconIndicator(
              icon: WeatherIcons.wind_direction,
              title: 'SE',
            ),
          ],
        ),
        Divider(
          thickness: 2,
          indent: MediaQuery.of(context).size.width * 0.3,
          endIndent: MediaQuery.of(context).size.width * 0.3,
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.orangeAccent[100]),),
          child: const Text(
            'Share',
            style: TextStyle(fontSize: 18, color: Colors.orange),
          ),
        ),
      ],
    );
  }
}
