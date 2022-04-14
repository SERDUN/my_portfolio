import 'package:flutter/material.dart';

class AppColorScheme {
  static const black = Color(0xff1a1a1a);
  static const grey = Color(0xFF767676);
  static const yellow = Color(0xffF58840);
  static const orange = Color(0xffB85252);
  static const white = Color(0xffEADEDE);
  static const white100 = Color(0xffffffff);

  static ColorScheme get appGeneralColorScheme {
    return const ColorScheme(
      primary: yellow,
      secondary: orange,
      surface: white,
      error: orange,
      onBackground: white,
      brightness: Brightness.dark,
      background: white,
      onError: yellow,
      onSecondary: orange,
      onPrimary: yellow,
      onSurface: white,
    );
  }

  static ColorScheme get appButtonColorScheme {
    return const ColorScheme(
      primary: yellow,
      secondary: orange,
      surface: white,
      error: orange,
      onBackground: white,
      brightness: Brightness.dark,
      background: white,
      onError: yellow,
      onSecondary: orange,
      onPrimary: yellow,
      onSurface: white,
    );
  }
}
