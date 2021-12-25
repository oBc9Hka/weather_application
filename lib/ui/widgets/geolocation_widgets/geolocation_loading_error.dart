import 'package:flutter/material.dart';

import '../custom_text_button.dart';

class GeolocationError extends StatelessWidget {
  const GeolocationError({
    Key? key,
    required this.onRetryPressed,
  }) : super(key: key);
  final Function onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width*0.8,
          ),
          child: const Text(
            '''Getting location failed.
Check, that geolocation on your device is ON and press "Retry"''',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
        CustomTextButton(onPressed: onRetryPressed, title: 'Retry',),
      ],
    );
  }
}
