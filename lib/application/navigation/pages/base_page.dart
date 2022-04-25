import 'package:flutter/widgets.dart';

abstract class BasePage extends Page {
  final Map<String, dynamic> args;

  const BasePage({required this.args, LocalKey? key, String? name})
      : super(key: key, name: name);

  Widget root();

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      maintainState: true,
      settings: this,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return root();
      },
    );
  }
}
