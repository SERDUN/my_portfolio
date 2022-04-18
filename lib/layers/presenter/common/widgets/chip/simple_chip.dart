import 'package:flutter/material.dart';
import 'package:my_portfolio/layers/presenter/common/extension/style/own_theme_fields.dart';

class SimpleChip extends StatelessWidget {
  final String text;

  const SimpleChip({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6?.copyWith(
            fontWeight: FontWeight.w100,
            fontStyle: FontStyle.italic,
            color: Theme.of(context).colorPlate().grey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}
