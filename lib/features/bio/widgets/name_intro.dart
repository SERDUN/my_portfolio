import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:my_portfolio/core/widgets/widgets.dart';

class NameIntro extends StatelessWidget {
  const NameIntro({
    super.key,
    required this.firstName,
    required this.secondName,
  });

  final String? firstName;
  final String? secondName;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        const Expanded(
          child: Dash(
            dashSize: 8,
            opacity: 0.25,
            direction: DashedLineDirection.horizontal,
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: firstName?.substring(0, 1) ?? "##### #####",
                style: textTheme.displayLarge?.copyWith(
                  color: colorScheme.primary,
                  fontFamily: GoogleFonts.comforter().fontFamily,
                ),
              ),
              TextSpan(
                text: firstName?.substring(1),
                style: textTheme.displayMedium?.copyWith(
                  fontFamily: GoogleFonts.comforter().fontFamily,
                ),
              ),
              TextSpan(
                text: " ${secondName?.substring(0, 1)}",
                style: textTheme.displayLarge?.copyWith(
                  color: colorScheme.primary,
                  fontFamily: GoogleFonts.comforter().fontFamily,
                ),
              ),
              TextSpan(
                text: secondName?.substring(1),
                style: textTheme.displayMedium?.copyWith(
                  fontFamily: GoogleFonts.comforter().fontFamily,
                ),
              ),
            ],
          ),
        ),
        const Expanded(
          child: Dash(
            dashSize: 8,
            opacity: 0.25,
            direction: DashedLineDirection.horizontal,
          ),
        ),
      ],
    );
  }
}
