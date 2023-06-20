import 'package:flutter/material.dart';

class DashVertical extends StatelessWidget {
  const DashVertical({
    Key? key,
    required this.height,
    this.width,
    this.margin = EdgeInsets.zero,
    this.opacity = 1.0,
    this.horizontalRepeatCount = 1,
    this.horizontalRepeatSpace = 8,
  }) : super(key: key);

  final double height;
  final double? width;
  final EdgeInsets margin;
  final double opacity;
  final double horizontalRepeatCount;
  final double horizontalRepeatSpace;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      child: CustomPaint(
        size: Size(1, height),
        painter: DashedLineVerticalPainter(
          opacity,
          horizontalRepeatCount,
          horizontalRepeatSpace,
          Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  DashedLineVerticalPainter(
    this.opacity,
    this.horizontalRepeatCount,
    this.horizontalRepeatSpace,
    this.color,
  );

  final double opacity;
  final double horizontalRepeatCount;
  final double horizontalRepeatSpace;

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 8, dashSpace = 8, startY = 0;
    final paint = Paint()
      ..color = color.withOpacity(opacity)
      ..strokeWidth = 1;
    while (startY < size.height) {
      // canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      for (int i = 0; i < horizontalRepeatCount; i++) {
        canvas.drawLine(
            Offset(i * horizontalRepeatSpace, startY), Offset(i * horizontalRepeatSpace, startY + dashHeight), paint);
      }

      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
