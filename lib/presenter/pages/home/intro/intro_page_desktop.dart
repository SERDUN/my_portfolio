import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:my_portfolio/presenter/common/extension/style/own_theme_fields.dart';
import 'package:octo_image/octo_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common/widgets/button/button_outline.dart';
import '../../../common/widgets/dash/dash_vertical.dart';
import 'package:transparent_image/transparent_image.dart';

class IntroPageDesktop extends StatefulWidget {
  const IntroPageDesktop({Key? key}) : super(key: key);

  @override
  State<IntroPageDesktop> createState() => _IntroPageDesktopState();
}

class _IntroPageDesktopState extends State<IntroPageDesktop>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    offset = Tween<Offset>(end: Offset.zero, begin: const Offset(0.0, 1.0))
        .animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<bool> fetchData() => Future.delayed(const Duration(seconds: 2), () {
        return true;
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 328,
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(flex: 1, child: buildDashVertical()),
            Flexible(
              child: buildMainContent(),
              flex: 1,
            ),
            Flexible(
              child: buildPhoto(context),
              flex: 1,
            ),
          ]),
    );
  }

  DashVertical buildDashVertical() {
    return DashVertical(
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
            "Mobile developer",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          RichText(
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
              var url =
                  "https://drive.google.com/file/d/1aZ-BcXJFSG8AjnjniG0OEM5NBzm8CMwk/view?usp=sharing";
              await canLaunch(url)
                  ? await launch(url)
                  : throw 'Could not launch $url';
            },
          ),
          const SizedBox(
            height: 8,
          ),
          const DashVertical(
            height: 88,
          ),
          // buildSocial()
        ],
      ),
    );
  }

  Widget buildPhoto(BuildContext context) {
    return Stack(alignment: Alignment.bottomRight, children: [
      buildDashVertical(),
      FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        width: 324,
        alignment: Alignment.bottomRight,
        height: 324,
        image: 'assets/image/patterns/my_photo.png',
      ),
    ]);
  }
}
