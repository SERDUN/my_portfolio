import 'package:flutter/material.dart';
import 'package:my_portfolio/presenter/common/style/app_colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.yellow,
      cardColor:AppColors.white100 ,
      cardTheme: CardTheme(color:AppColors.white100 ),
      colorScheme: ColorScheme(
          onSurface: AppColors.yellow,
          secondary:  AppColors.yellow,
          surface:  AppColors.yellow,
          onBackground:  AppColors.white,
          brightness:  Brightness.dark,
          background:   AppColors.white,
          onPrimary:  AppColors.yellow,
          primary:  AppColors.yellow,
          error:  AppColors.yellow,
          onError:  AppColors.yellow,
          onSecondary:  AppColors.yellow),
      textTheme: TextTheme(
          headline1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: AppColors.black),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 16.0, color: AppColors.white),
          bodyText1: TextStyle(
              fontSize: 16, letterSpacing: 0.5, color: AppColors.black)),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.deepPurple,
        colorScheme: ColorScheme( onSurface: AppColors.yellow,
            surface:  AppColors.yellow,
            onBackground:  AppColors.white,
            brightness:  Brightness.dark,
            background:   AppColors.white,
            onPrimary:  AppColors.black,
            primary:  AppColors.black,
            error:  AppColors.yellow,
            onError:  AppColors.yellow,
            secondary:  AppColors.orange,
            onSecondary:  AppColors.orange)
      ),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Cormorant',
    );
  }
}
