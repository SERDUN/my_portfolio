import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:my_portfolio/layers/domain/entity/model/user/portfolio_user_model.dart';
import 'package:my_portfolio/main.dart';
import 'package:octo_image/octo_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/widgets/button/button_outline.dart';
import '../../../../common/widgets/dash/dash_vertical.dart';

class IntroPageDesktop extends StatelessWidget {
  final PortfolioUserModel? userModel;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const IntroPageDesktop(
      {Key? key,
      required this.userModel,
      required this.textTheme,
      required this.colorScheme})
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
          AnimatedOpacity(
              opacity: userModel?.position != null ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              // The green box must be a child of the AnimatedOpacity widget.
              child: SelectableText(
                userModel?.position ?? "",
                style: textTheme.subtitle1,
              )),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: 'D',
                    style: textTheme.headline1?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: colorScheme.primary)),
                TextSpan(
                    text: 'mitro',
                    style: textTheme.headline1
                        ?.copyWith(fontWeight: FontWeight.w500)),
                TextSpan(
                    text: ' S',
                    style: textTheme.headline1?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: colorScheme.primary)),
                TextSpan(
                    text: 'erdun',
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
            onTap: () async {
              await canLaunch(userModel?.cv ?? "")
                  ? await launch(userModel?.cv ?? "")
                  : throw 'Could not launch $userModel?.cv??""';
            },
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

  Widget buildPhoto(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: Container(
          width: 264,
          height: 264,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(224)),
              color: Colors.orange.withOpacity(0.1)),
        )),
        Center(
            child: SizedBox(
                width: 224,
                height: 224,
                child: Card(
                    elevation: 4,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(224),
                    ),
                    color: Colors.transparent,
                    shadowColor: Colors.orange,
                    child: OctoImage(
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.medium,
                      width: 128,
                      height: 128,
                      image: Image.network(
                              "https://raw.githubusercontent.com/SERDUN/res_media_screenshots/main/data/avatar2.webp")
                          .image,
                    )))),
      ],
    );
  }
}
