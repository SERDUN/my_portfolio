import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/extension/extension.dart';
import 'package:my_portfolio/core/widgets/dash/dash.dart';

class NameIntro extends StatelessWidget {
  const NameIntro({
    super.key,
    required this.fullName,
  });

  final String? fullName;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        const Expanded(
          child: DashHorizontal(
            dashWidth: 8,
            opacity: 0.25,
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: fullName?.getLetter() ?? "##### #####",
                style: textTheme.displayLarge?.copyWith(
                  color: colorScheme.primary,
                  fontFamily: GoogleFonts.comforter().fontFamily,
                ),
              ),
              TextSpan(
                text: fullName?.getLettersFromPosition(wordPosition: 0, fromPosition: 1),
                style: textTheme.displayMedium?.copyWith(
                  fontFamily: GoogleFonts.comforter().fontFamily,
                ),
              ),
              TextSpan(
                text: " ${fullName?.getLetter().getLetter(wordPosition: 1)}",
                style: textTheme.displayLarge?.copyWith(
                  fontFamily: GoogleFonts.comforter().fontFamily,
                  color: colorScheme.primary,
                ),
              ),
              TextSpan(
                text: fullName?.getLetter().getLettersFromPosition(wordPosition: 1, fromPosition: 1),
                style: textTheme.displayMedium?.copyWith(
                  fontFamily: GoogleFonts.comforter().fontFamily,
                ),
              ),
            ],
          ),
        ),
        const Expanded(
          child: DashHorizontal(
            dashWidth: 8,
            opacity: 0.25,
          ),
        ),
      ],
    );
  }
}
