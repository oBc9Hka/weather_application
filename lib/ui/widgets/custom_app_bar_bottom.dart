import 'package:flutter/material.dart';

class CustomAppBarBottom extends StatelessWidget with PreferredSizeWidget{
  const CustomAppBarBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: SizedBox(
        height: 3,
        width: MediaQuery.of(context).size.width,
        child: CustomPaint(
          painter: CustomLinePainter(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}

class CustomLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final colorsArray = [
      Colors.purpleAccent,
      Colors.deepOrangeAccent,
      Colors.green,
      Colors.blue,
      Colors.orangeAccent,
      Colors.red,
    ];

    double startX = 0;

    for (var color in colorsArray) {
      for (int i = 0; i < 10; i++) {
        _drawCustomLine(canvas, size, startX, color);
        startX += size.width/100*1.66;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _drawCustomLine(Canvas canvas, Size size, double startX, Color color) {
    Paint paint0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path()
      ..moveTo(startX, 0)
      ..lineTo(startX + size.width/100, size.height)
      ..lineTo(startX + size.width/100*2, size.height)
      ..lineTo(startX + size.width/100, 0)
      ..close();

    canvas.drawPath(path0, paint0);
  }
}
