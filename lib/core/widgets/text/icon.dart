import 'package:material_ui/material_ui.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.path, {
    super.key,
    this.size = 24,
    this.color,
    this.background,
  });

  final String path;
  final double size;
  final Color? color;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      child: Image.asset(path, color: color, height: size, width: size),
    );
  }
}
