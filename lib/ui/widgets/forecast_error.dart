import 'package:flutter/material.dart';

class ForecastError extends StatelessWidget {
  const ForecastError({Key? key, required this.onRetryPressed})
      : super(key: key);
  final Function onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '''Some error is occurs.
          You can press button to retry, or retry later''',
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: () {
            onRetryPressed();
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.orangeAccent[100]),
          ),
          child: const Text(
            'Retry',
            style: TextStyle(fontSize: 18, color: Colors.orange),
          ),
        ),
      ],
    );
  }
}
