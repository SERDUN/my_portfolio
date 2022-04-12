
import 'package:flutter/material.dart';

class DashVertical extends StatelessWidget {
  final double height;
   const DashVertical({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        size: Size(1, height),
        painter: DashedLineVerticalPainter()
    );
  }
}


class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 8,
        dashSpace = 8,
        startY = 0;
    final paint = Paint()
      ..color = Colors.orange[300]!
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}