import 'package:flutter/material.dart';
import 'package:weather_application/ui/widgets/custom_text_button.dart';

class ForecastError extends StatelessWidget {
  const ForecastError({Key? key, required this.onRetryPressed})
      : super(key: key);
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
            '''Some error is occurs.
Check your Internet connection and press "Retry", or retry later''',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
        CustomTextButton(onPressed: onRetryPressed, title: 'Retry',),
      ],
    );
  }
}
