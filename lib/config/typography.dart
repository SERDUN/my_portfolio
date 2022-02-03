import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

// Simple
TextStyle headlineTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
        fontSize: 26,
        color: textPrimary,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w300));

TextStyle headlineSecondaryTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
        fontSize: 20, color: textPrimary, fontWeight: FontWeight.w300));

TextStyle subtitleTextStyle = GoogleFonts.openSans(
    textStyle: TextStyle(fontSize: 14, color: textSecondary, letterSpacing: 1));

TextStyle bodyTextStyle = GoogleFonts.openSans(
    textStyle: TextStyle(fontSize: 14, color: textPrimary));

TextStyle buttonTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(fontSize: 14, color: textPrimary, letterSpacing: 1));

TextStyle buttonTextStyle16 = GoogleFonts.montserrat(
    textStyle: TextStyle(fontSize: 16, color: textPrimary, letterSpacing: 1));

TextStyle buttonTextStyle32White = GoogleFonts.montserrat(
    textStyle: TextStyle(fontSize: 32, color: textPrimary, letterSpacing: 1));

TextStyle buttonTextStyle24White = GoogleFonts.montserrat(
    textStyle: TextStyle(fontSize: 24, color: textPrimary, letterSpacing: 1));
