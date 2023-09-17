import 'package:flutter/material.dart';

class DashHorizontal extends StatelessWidget {
  const DashHorizontal({
    Key? key,
    this.margin = EdgeInsets.zero,
    this.opacity = 0.5,
    this.dashSpace = 16.0,
    this.dashWidth = 16.0,
  }) : super(key: key);

  final EdgeInsets margin;
  final double opacity;
  final double dashSpace;
  final double dashWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        margin: margin,
        child: CustomPaint(
          size: Size(constraints.maxWidth, 1),
          painter: DashedLineHorizontalPainter(
            opacity,
            dashSpace,
            dashWidth,
            Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    });
  }
}

class DashedLineHorizontalPainter extends CustomPainter {
  DashedLineHorizontalPainter(
    this.opacity,
    this.dashSpaceArg,
    this.dashHeightArg,
    this.color,
  );

  final double opacity;
  final double dashSpaceArg;
  final double dashHeightArg;

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = dashHeightArg, dashSpace = dashSpaceArg, startY = 0;
    final paint = Paint()
      ..color = color.withOpacity(opacity)
      ..strokeWidth = 1;
    while (startY < size.width) {
      canvas.drawLine(Offset(startY, 0), Offset(startY + dashHeight, 0), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
