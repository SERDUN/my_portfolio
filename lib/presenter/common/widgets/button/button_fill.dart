import 'package:flutter/material.dart';

class ButtonFill extends StatelessWidget {
  final Function onTap;
  final String text;


  const ButtonFill({Key? key, required this.onTap, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
       backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      primary: Theme.of(context).buttonTheme.colorScheme?.primary,
      padding: const EdgeInsets.all(16),
      textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
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
