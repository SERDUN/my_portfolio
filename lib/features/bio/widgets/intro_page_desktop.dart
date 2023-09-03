// import 'package:flutter/material.dart';
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'package:my_portfolio/core/extension/extension.dart';
// import 'package:my_portfolio/core/widgets/widgets.dart';
//
// class IntroPageDesktop extends StatelessWidget {
//   const IntroPageDesktop({
//     Key? key,
//     required this.textTheme,
//     required this.jobPosition,
//     required this.colorScheme,
//     required this.userFullName,
//     required this.openCv,
//   }) : super(key: key);
//
//   final String userFullName;
//   final String jobPosition;
//   final TextTheme textTheme;
//   final ColorScheme colorScheme;
//   final Function() openCv;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 328,
//       child: buildMainContent(),
//     );
//   }
//
//   DashVertical buildDashVertical() {
//     return const DashVertical(
//       height: 328,
//       width: 224,
//       opacity: .3,
//       horizontalRepeatCount: 35,
//       margin: EdgeInsets.only(left: 0),
//     );
//   }
//
//   Widget buildMainContent() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(
//             height: 64,
//           ),
//           RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(children: [
//                 TextSpan(
//                   text: userFullName.getLetter(),
//                   style: textTheme.displayLarge?.copyWith(
//                     color: colorScheme.primary,
//                     fontFamily: GoogleFonts.comforter().fontFamily,
//                   ),
//                 ),
//                 TextSpan(
//                   text: userFullName.getLettersFromPosition(wordPosition: 0, fromPosition: 1),
//                   style: textTheme.displayMedium?.copyWith(
//                     fontFamily: GoogleFonts.comforter().fontFamily,
//                   ),
//                 ),
//                 TextSpan(
//                   text: " ${userFullName.getLetter(wordPosition: 1)}",
//                   style: textTheme.displayLarge?.copyWith(
//                     fontFamily: GoogleFonts.comforter().fontFamily,
//                     color: colorScheme.primary,
//                   ),
//                 ),
//                 TextSpan(
//                   text: userFullName.getLettersFromPosition(wordPosition: 1, fromPosition: 1),
//                   style: textTheme.displayMedium?.copyWith(
//                     fontFamily: GoogleFonts.comforter().fontFamily,
//                   ),
//                 ),
//               ])),
//           const DashVertical(
//             height: 24,
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           ButtonOutline(
//             text: tr("button_download_cv"),
//             onTap: () => openCv.call(),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           const Expanded(
//               child: DashVertical(
//             height: double.infinity,
//           )),
//           // buildSocial()
//         ],
//       ),
//     );
//   }
// }
