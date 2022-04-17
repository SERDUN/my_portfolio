import 'package:flutter/material.dart';

class ButtonOutline extends StatelessWidget {
  final Function onTap;
  final String text;

  const ButtonOutline({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      elevation: 0,
      primary: Theme.of(context).buttonTheme.colorScheme?.primary,
      padding: const EdgeInsets.all(16),
      textStyle: Theme.of(context).textTheme.button?.copyWith(fontWeight: FontWeight.w100),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(color:Theme.of(context).buttonTheme.colorScheme!.primary)),
    );

    return TextButton(
      onPressed: () => onTap(),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
      style: flatButtonStyle,
    );
  }
}
