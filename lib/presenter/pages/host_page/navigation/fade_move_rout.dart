import 'package:flutter/material.dart';

class FadeMovePageRout<T> extends MaterialPageRoute<T> {
  FadeMovePageRout(
      {required WidgetBuilder builder, required RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}
