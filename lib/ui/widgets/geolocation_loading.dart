import 'package:flutter/material.dart';
import 'package:weather_application/ui/widgets/custom_progress_indicator.dart';

class GeolocationLoading extends StatelessWidget {
  const GeolocationLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('Getting your location...'),
        Padding(padding: EdgeInsets.only(top: 20)),
        CustomCircularProgressIndicator(),
      ],
    );
  }
}
