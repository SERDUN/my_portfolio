import 'package:flutter/material.dart';

class AppColorsPlate {
  final Color? grey;
  final Color? black;
  final Color? white100;
  final Color? orange;
  final Color? yellow;

  AppColorsPlate({this.grey, this.white100, this.black,this.orange, this.yellow, });

  factory AppColorsPlate.empty() {
    return AppColorsPlate();
  }
}

extension ThemeDataExtensions on ThemeData {
  static final Map<InputDecorationTheme, AppColorsPlate> _own = {};

  void addOwn(AppColorsPlate own) {
    _own[inputDecorationTheme] = own;
  }

  static AppColorsPlate? empty;

  AppColorsPlate colorPlate() {
    var o = _own[inputDecorationTheme];
    if (o == null) {
      empty ??= AppColorsPlate.empty();
      o = empty;
    }
    return o!;
  }
}

AppColorsPlate ownTheme(BuildContext context) => Theme.of(context).colorPlate();
