import 'package:flutter/material.dart';

class ButtonOutline extends StatelessWidget {
  final Function onTap;
  final String text;
  final double? width;
  final double corner;
  final EdgeInsets? margin;

  const ButtonOutline({Key? key, required this.onTap, required this.text, this.corner = 16, this.width, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(corner),
        side: BorderSide(
          color: Theme.of(context).buttonTheme.colorScheme!.primary,
        ),
      ),
    );

    return Container(
      margin: margin,
      width: width,
      child: TextButton(
        onPressed: () => onTap(),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
        style: flatButtonStyle,
      ),
    );
  }
}
