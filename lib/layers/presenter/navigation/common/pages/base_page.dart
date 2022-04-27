import 'package:flutter/widgets.dart';

typedef TransitionAnimationBuilder = Widget Function(
  BuildContext,
  Animation<double>,
  Animation<double>,
  Widget,
);

abstract class BasePage extends Page {
  final Map<String, dynamic> args;
  final int transitionDuration, reverseTransitionDuration; //milliseconds
  final TransitionAnimationBuilder? animationBuilder;

  const BasePage({
    required this.args,
    LocalKey? key,
    String? name,
    this.transitionDuration = 50,
    this.reverseTransitionDuration = 50,
    this.animationBuilder,
  }) : super(key: key, name: name);

  Widget root();

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      reverseTransitionDuration:
          Duration(milliseconds: reverseTransitionDuration),
      transitionDuration: Duration(milliseconds: transitionDuration),
      maintainState: true,
      settings: this,
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) =>
          animationBuilder?.call(
            context,
            animation,
            secondaryAnimation,
            child,
          ) ??
          _defaultAnimationBuilder(
            context,
            animation,
            secondaryAnimation,
            child,
          ),
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> animation2,
      ) =>
          root(),
    );
  }

  Widget _defaultAnimationBuilder(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.elasticIn;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}
