import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      backgroundColor: Colors.orangeAccent,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
    );
  }
}
