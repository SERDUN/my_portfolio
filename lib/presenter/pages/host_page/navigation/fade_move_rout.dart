import 'package:flutter/material.dart';

class FadeMovePageRout<T> extends MaterialPageRoute<T> {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 100);

  FadeMovePageRout(
      {required WidgetBuilder builder, required RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );

  }
}
