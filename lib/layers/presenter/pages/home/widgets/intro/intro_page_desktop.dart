import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/layers/domain/entity/model/user/portfolio_user_model.dart';
import 'package:octo_image/octo_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/widgets/button/button_outline.dart';
import '../../../../common/widgets/dash/dash_vertical.dart';


class IntroPageDesktop extends StatefulWidget {
  final PortfolioUserModel? userModel;

  const IntroPageDesktop({required this.userModel, Key? key}) : super(key: key);

  @override
  State<IntroPageDesktop> createState() => _IntroPageDesktopState();
}

class _IntroPageDesktopState extends State<IntroPageDesktop> {
  Future<bool> fetchData() => Future.delayed(const Duration(seconds: 2), () {
        return true;
      });

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
              opacity: widget.userModel?.position != null ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              // The green box must be a child of the AnimatedOpacity widget.
              child: SelectableText(
                widget.userModel?.position ?? "",
                style: Theme.of(context).textTheme.subtitle1,
              )),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: 'D',
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary)),
                TextSpan(
                    text: 'mitro',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontWeight: FontWeight.w500)),
                TextSpan(
                    text: ' S',
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary)),
                TextSpan(
                    text: 'erdun',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontWeight: FontWeight.w500)),
              ])),
          const DashVertical(
            height: 24,
          ),
          const SizedBox(
            height: 8,
          ),
          ButtonOutline(
            text: 'Download CV',
            onTap: () async {
              await canLaunch(widget.userModel?.cv ?? "")
                  ? await launch(widget.userModel?.cv ?? "")
                  : throw 'Could not launch $widget.userModel?.cv??""';
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
              borderRadius: BorderRadius.all(Radius.circular(224)),
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
