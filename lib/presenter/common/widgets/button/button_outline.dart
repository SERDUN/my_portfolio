import 'package:flutter/material.dart';

class ButtonOutline extends StatelessWidget {
  final Function onTap;
  final String text;


  const ButtonOutline({Key? key, required this.onTap, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.6),
      elevation: 0,
      primary: Theme.of(context).buttonTheme.colorScheme?.secondary,
      padding: const EdgeInsets.all(8),
      textStyle: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w800),
      shape:  RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(color: Theme.of(context).primaryColor)
      ),
    );

    return TextButton(
      onPressed: () => onTap,
      child:  Text(
        text,
        textAlign: TextAlign.center,
      ),
      style: flatButtonStyle,
    );
  }
}
