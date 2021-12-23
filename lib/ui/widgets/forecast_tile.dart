import 'package:flutter/material.dart';

class ForecastTile extends StatelessWidget {
  const ForecastTile({
    Key? key,
    required this.icon,
    required this.time,
    required this.weatherState,
    required this.temperature,
  }) : super(key: key);
  final Widget icon;
  final String time;
  final String weatherState;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 100,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: icon,
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(weatherState),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                '$temperature°',
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 50,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          )
        ],
      ),
    );
  }
}
