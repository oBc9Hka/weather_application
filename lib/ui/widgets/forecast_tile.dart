import 'package:flutter/material.dart';

class ForecastTile extends StatelessWidget {
  const ForecastTile({
    Key? key,
    required this.icon,
    required this.time,
    required this.weatherState,
    required this.temperature,
  }) : super(key: key);
  final IconData icon;
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
            flex: 1,
            child: Icon(icon, color: Colors.orangeAccent, size: 50,),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time),
                Text(weatherState),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '$temperature°',
              style: const TextStyle(color: Colors.blue, fontSize: 50),
            ),
          )
        ],
      ),
    );
  }
}
