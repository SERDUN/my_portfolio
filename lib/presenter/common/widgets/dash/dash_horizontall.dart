import 'package:flutter/material.dart';

class DashHorizontal extends StatelessWidget {
  final double width;
  final EdgeInsets margin;

  const DashHorizontal(
      {Key? key, required this.width, this.margin = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
          size: Size(width, 1), painter: DashedLineVerticalPainter()),
      margin: margin,
    );
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 8, dashSpace = 8, startY = 0;
    final paint = Paint()
      ..color = Colors.orange[300]!
      ..strokeWidth = 1;
    while (startY < size.width) {
      canvas.drawLine(Offset(startY, 0), Offset(startY + dashHeight, 0), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
