import 'package:flutter/material.dart';

class DashDivider extends StatelessWidget {
  const DashDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2,
      width: MediaQuery.of(context).size.width*0.4,
      child: CustomPaint(
        painter: DashDividerPainter(),
      ),
    );
  }
}

class DashDividerPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
    ..color = Colors.black12
    ..strokeCap = StrokeCap.square
    ..strokeWidth = 2;

    _drawDashedLine(canvas, size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _drawDashedLine(Canvas canvas, Size size, Paint paint) {
    const int dashWidth = 3;
    const int dashSpace = 3;

    double startX = 0;
    double y = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, y), Offset(startX + dashWidth, y), paint);

      startX += dashWidth + dashSpace;
    }
  }
}
