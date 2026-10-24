import 'package:material_ui/material_ui.dart';

class SimpleChip extends StatelessWidget {
  const SimpleChip({
    super.key,
    required this.text,
    this.color,
    this.textStyle,
  });

  final String text;
  final Color? color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.primary.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
