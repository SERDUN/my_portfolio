import 'package:flutter/material.dart';
import 'package:my_portfolio/layers/presenter/common/extension/style/own_theme_fields.dart';

import 'app_color_scheme.dart';
import 'app_style_text.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColorScheme.yellow,
      cardColor: AppColorScheme.white100,
      cardTheme: const CardTheme(color: AppColorScheme.white100),
      colorScheme: AppColorScheme.appGeneralColorScheme,
      textTheme: AppTextStyle.defaultTheme,
      buttonTheme: ButtonThemeData(
          buttonColor: AppColorScheme.orange,
          colorScheme: AppColorScheme.appButtonColorScheme),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Cormorant',
    )..addOwn(AppColorsPlate(
        black: AppColorScheme.black,
        orange: AppColorScheme.orange,
        grey: AppColorScheme.grey,
        white100: AppColorScheme.white100,
        yellow: AppColorScheme.yellow));
  }
}
