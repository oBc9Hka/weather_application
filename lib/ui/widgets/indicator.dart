import 'package:flutter/material.dart';

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
          Icon(
            icon,
            color: Colors.orangeAccent,
            size: MediaQuery.of(context).size.height >
                    MediaQuery.of(context).size.width
                ? MediaQuery.of(context).size.height * 0.04
                : MediaQuery.of(context).size.width * 0.04, //30,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
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
