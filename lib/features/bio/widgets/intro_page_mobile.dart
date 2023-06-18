import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:octo_image/octo_image.dart';

import 'package:my_portfolio/core/extension/extension.dart';
import 'package:my_portfolio/core/widgets/widgets.dart';

class IntroPageMobile extends StatelessWidget {
  final String? avatar;
  final String userFullName;
  final String jobPosition;
  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final Function()? openCv;

  const IntroPageMobile(
      {Key? key,
      required this.userFullName,
      required this.jobPosition,
      required this.textTheme,
      required this.colorScheme,
      this.openCv,
      required this.avatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 16,
        ),
        avatar == null
            ? const SizedBox(
                width: 128,
                height: 128,
              )
            : OctoImage.fromSet(
                fit: BoxFit.cover,
                filterQuality: FilterQuality.medium,
                width: 128,
                height: 128,
                image: Image.network(avatar!).image,
                octoSet: OctoSet.circleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  text: Text(
                    "SD",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ),
        Align(
          alignment: Alignment.center,
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: userFullName.getLetter(),
                    style: textTheme.headline1?.copyWith(fontWeight: FontWeight.w500, color: colorScheme.primary)),
                TextSpan(
                    text: userFullName.getLettersFromPosition(wordPosition: 0, fromPosition: 1),
                    style: textTheme.headline1?.copyWith(fontWeight: FontWeight.w500)),
                TextSpan(
                    text: " ${userFullName.getLetter(wordPosition: 1)}",
                    style: textTheme.headline1?.copyWith(fontWeight: FontWeight.w500, color: colorScheme.primary)),
                TextSpan(
                    text: userFullName.getLettersFromPosition(wordPosition: 1, fromPosition: 1),
                    style: textTheme.headline1?.copyWith(fontWeight: FontWeight.w500)),
              ])),
        ),
        const SizedBox(
          height: 8,
        ),
        SelectableText(
          jobPosition,
          style: textTheme.subtitle1,
        ),
        const SizedBox(
          height: 8,
        ),
        ButtonOutline(
          text: tr("button_download_cv"),
          onTap: () => openCv?.call(),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
