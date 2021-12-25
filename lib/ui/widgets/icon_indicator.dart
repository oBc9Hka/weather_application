import 'package:dash_painter/dash_decoration.dart';
import 'package:flutter/material.dart';
import 'package:weather_application/constants.dart';

class IconIndicator extends StatelessWidget {
  const IconIndicator({Key? key, required this.icon, required this.title})
      : super(key: key);
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 60,
        minHeight: 60,
        maxHeight: 80,
        maxWidth: 80,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: DashDecoration(
              gradient: const SweepGradient(
                colors: [
                  Colors.grey,
                  Colors.grey,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                icon,
                color: Constants.iconsColor,
                size: MediaQuery.of(context).size.height >
                        MediaQuery.of(context).size.width
                    ? MediaQuery.of(context).size.height * 0.04
                    : MediaQuery.of(context).size.width * 0.04, //30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Fluro',
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CompassIconIndicator extends StatelessWidget {
  const CompassIconIndicator({Key? key, required this.icon, required this.title}) : super(key: key);
  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 60,
        minHeight: 60,
        maxHeight: 80,
        maxWidth: 80,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: DashDecoration(
              gradient: const SweepGradient(
                colors: [
                  Colors.grey,
                  Colors.grey,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Fluro',
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
