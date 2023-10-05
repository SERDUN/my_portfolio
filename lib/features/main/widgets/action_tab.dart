import 'package:flutter/material.dart';

class ActionTab extends StatelessWidget {
  const ActionTab({
    super.key,
    required this.isSelected,
    required this.onTab,
    required this.title,
  });

  final bool isSelected;
  final Function onTab;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.primary.withOpacity(isSelected ? 0.1 : 0.0),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),
      ),
      onPressed: () => onTab(),
      child: Text(title, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
