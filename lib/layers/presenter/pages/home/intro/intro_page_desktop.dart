import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_portfolio/layers/domain/entity/model/user/portfolio_user_model.dart';
import 'package:octo_image/octo_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common/widgets/button/button_outline.dart';
import '../../../common/widgets/dash/dash_vertical.dart';
import 'package:transparent_image/transparent_image.dart';

class IntroPageDesktop extends StatefulWidget {
  final PortfolioUserModel? userModel;

  const IntroPageDesktop({required this.userModel, Key? key}) : super(key: key);

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
            Flexible(
                flex: 1,
                child: Stack(
                  children: [
                    buildDashVertical(),
                    Align(
                      child: Container(
                        margin: EdgeInsets.only(left: 8, bottom: 8),
                        child: Text(
                          "v.1.0.0+1 (In develop)",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: Colors.red),
                        ),
                      ),
                      alignment: Alignment.bottomLeft,
                    )
                  ],
                )),
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
      widget.userModel?.avatar != null
          ? FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              width: 324,
              alignment: Alignment.bottomRight,
              height: 229,
              fit: BoxFit.cover,
              image: widget.userModel!.avatar,
            )
          : const SizedBox(
              width: 324,
            ),
    ]);
  }
}
