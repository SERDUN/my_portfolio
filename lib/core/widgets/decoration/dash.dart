import 'package:flutter/material.dart';

enum DashedLineDirection {
  horizontal,
  vertical,
}

class Dash extends StatelessWidget {
  const Dash({
    Key? key,
    this.margin = EdgeInsets.zero,
    this.opacity = 0.5,
    this.dashSpace = 16.0,
    this.dashSize = 16.0,
    required this.direction,
  }) : super(key: key);

  final EdgeInsets margin;
  final double opacity;
  final double dashSpace;
  final double dashSize;
  final DashedLineDirection direction;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          margin: margin,
          child: CustomPaint(
            size: direction == DashedLineDirection.horizontal
                ? Size(constraints.maxWidth, 1)
                : Size(1, constraints.maxHeight),
            painter: DashedLinePainter(
              Theme.of(context).colorScheme.primary,
              opacity,
              dashSpace,
              dashSize,
              direction,
            ),
          ),
        );
      },
    );
  }
}

class DashedLinePainter extends CustomPainter {
  DashedLinePainter(
    this.color,
    this.opacity,
    this.dashSpaceArg,
    this.dashHeightArg,
    this.direction,
  );

  final Color color;

  final double opacity;
  final double dashSpaceArg;
  final double dashHeightArg;
  final DashedLineDirection direction;

  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = dashHeightArg, dashSpace = dashSpaceArg, startY = 0;
    final paint = Paint()
      ..color = color.withOpacity(opacity)
      ..strokeWidth = 1;

    switch (direction) {
      case DashedLineDirection.horizontal:
        while (startY < size.width) {
          canvas.drawLine(Offset(startY, 0), Offset(startY + dashHeight, 0), paint);
          startY += dashHeight + dashSpace;
        }
        break;
      case DashedLineDirection.vertical:
        while (startY < size.height) {
          canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);

          startY += dashHeight + dashSpace;
        }
        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
