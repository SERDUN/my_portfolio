import 'package:flutter/material.dart';

class DecorationViewLines extends StatelessWidget {
  final EdgeInsets margin;

  const DecorationViewLines(
      {Key? key, this.margin = const EdgeInsets.symmetric(vertical: 8)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: 75, height: 2, color: Theme.of(context).primaryColor),
          const SizedBox(height: 3),
          Container(
              width: 50, height: 2, color: Theme.of(context).primaryColor),
        ],
      ),
    );
  }
}
