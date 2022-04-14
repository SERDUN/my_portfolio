import 'package:flutter/material.dart';

import 'app_color_scheme.dart';

class AppTextStyle {
  static TextTheme get defaultTheme {
    return const TextTheme(
      subtitle1: TextStyle(
          fontSize: 14.0,
          color: AppColorScheme.grey,
          fontStyle: FontStyle.italic),
      subtitle2: TextStyle(
          fontSize: 16.0,
          color: AppColorScheme.orange,
          fontWeight: FontWeight.bold),
      headline1: TextStyle(fontSize: 40.0, color: AppColorScheme.black),
      headline2: TextStyle(fontSize: 32.0, color: AppColorScheme.black),
      headline3: TextStyle(fontSize: 24.0, color: AppColorScheme.black),
      headline4: TextStyle(fontSize: 18.0, color: AppColorScheme.black),
      headline5: TextStyle(fontSize: 16.0, color: AppColorScheme.black),
      headline6: TextStyle(fontSize: 14.0, color: AppColorScheme.black),
      overline: TextStyle(fontSize: 14.0, color: AppColorScheme.grey),
      button: TextStyle(fontSize: 16.0, color: AppColorScheme.grey),
      caption: TextStyle(fontSize: 14.0, color: AppColorScheme.grey),
      bodyText1: TextStyle(
          fontSize: 16,
          letterSpacing: 0.5,
          color: AppColorScheme.black,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w100),
      bodyText2: TextStyle(
          fontSize: 16,
          letterSpacing: 0.5,
          color: AppColorScheme.white,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w100),
    );
  }
}
