import 'package:flutter/material.dart';

class DashHorizontal extends StatelessWidget {
  final double width;
  final EdgeInsets margin;
  final double opacity;
  final double dashSpace;
  final double dashHeight;

  const DashHorizontal(
      {Key? key,
      required this.width,
      this.margin = EdgeInsets.zero,
      this.opacity = 1.0,
      this.dashSpace = 8.0,
      this.dashHeight = 8.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
          size: Size(width, 1),
          painter: DashedLineHorizontalPainter(opacity, dashSpace, dashHeight)),
      margin: margin,
    );
  }
}

class DashedLineHorizontalPainter extends CustomPainter {
  final double opacity;
  final double dashSpaceArg;
  final double dashHeightArg;

  DashedLineHorizontalPainter(
      this.opacity, this.dashSpaceArg, this.dashHeightArg);

  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = dashHeightArg, dashSpace = dashSpaceArg, startY = 0;
    final paint = Paint()
      ..color = Colors.orange[300]!.withOpacity(opacity)
      ..strokeWidth = 1;
    while (startY < size.width) {
      canvas.drawLine(Offset(startY, 0), Offset(startY + dashHeight, 0), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
