import 'package:flutter/material.dart';

class SimpleChip extends StatelessWidget {
  const SimpleChip({
    Key? key,
    required this.text,
    this.color,
    this.textStyle,
  }) : super(key: key);

  final String text;
  final Color? color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.primary.withOpacity(0.4),
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}
