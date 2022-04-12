import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class CustomTheme {
  static ThemeData get lightTheme { //1
    return ThemeData( //2
        primaryColor: Colors.purple,
        textTheme:  TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          bodyText1: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 14, color: textSecondary,letterSpacing: 0.5,fontWeight: FontWeight.w300))
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat', //3

    );
  }
}

// ThemeData(
// textTheme: GoogleFonts.latoTextTheme(
// Theme.of(context).textTheme, // If this is not set, then ThemeData.light().textTheme is used.
// ),
// )