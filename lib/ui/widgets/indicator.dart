import 'package:flutter/material.dart';

class IconIndicator extends StatelessWidget {
  const IconIndicator({Key? key, required this.icon, required this.title}) : super(key: key);
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 80,
        maxHeight: 50,
        maxWidth: 80,
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.orangeAccent,),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(title),
          ),
        ],
      ),
    );
  }
}
