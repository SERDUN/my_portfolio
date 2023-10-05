import 'package:flutter/material.dart';

class ButtonFill extends StatelessWidget {
  const ButtonFill({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      padding: const EdgeInsets.all(16),
      textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0), side: BorderSide(color: Theme.of(context).primaryColor)),
    );

    return TextButton(
      onPressed: () => onTap,
      style: flatButtonStyle,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
