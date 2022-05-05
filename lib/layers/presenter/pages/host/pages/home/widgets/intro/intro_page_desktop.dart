import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/layers/presenter/common/extension/naming_extension.dart';

import '../../../../../../common/widgets/button/button_outline.dart';
import '../../../../../../common/widgets/dash/dash_vertical.dart';


class IntroPageDesktop extends StatelessWidget {
  final String userFullName;
  final String jobPosition;
  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final Function()? openCv;

  const IntroPageDesktop(
      {Key? key,
      required this.textTheme,
      required this.jobPosition,
      required this.colorScheme,
      required this.userFullName,
      required this.openCv})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 328,
      child: buildMainContent(),
    );
  }

  DashVertical buildDashVertical() {
    return const DashVertical(
      height: 328,
      width: 224,
      opacity: .3,
      horizontalRepeatCount: 35,
      margin: EdgeInsets.only(left: 0),
    );
  }

  Widget buildMainContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 88,
          ),
          SelectableText(
            jobPosition,
            style: textTheme.subtitle1,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: userFullName.getLetter(),
                    style: textTheme.headline1?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: colorScheme.primary)),
                TextSpan(
                    text: userFullName.getLettersFromPosition(
                        wordPosition: 0, fromPosition: 1),
                    style: textTheme.headline1
                        ?.copyWith(fontWeight: FontWeight.w500)),
                TextSpan(
                    text: " ${userFullName.getLetter(wordPosition: 1)}",
                    style: textTheme.headline1?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: colorScheme.primary)),
                TextSpan(
                    text: userFullName.getLettersFromPosition(
                        wordPosition: 1, fromPosition: 1),
                    style: textTheme.headline1
                        ?.copyWith(fontWeight: FontWeight.w500)),
              ])),
          const DashVertical(
            height: 24,
          ),
          const SizedBox(
            height: 8,
          ),
          ButtonOutline(
            text: tr("button_download_cv"),
            onTap: () => openCv?.call(),
          ),
          const SizedBox(
            height: 8,
          ),
          const Expanded(
              child: DashVertical(
            height: double.infinity,
          )),
          // buildSocial()
        ],
      ),
    );
  }
}
