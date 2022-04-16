import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_portfolio/layers/presenter/common/extension/style/own_theme_fields.dart';
import 'package:octo_image/octo_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common/widgets/button/button_outline.dart';
import '../../../common/widgets/dash/dash_vertical.dart';

class IntroPageMobile extends StatefulWidget {
  const IntroPageMobile({Key? key}) : super(key: key);

  @override
  State<IntroPageMobile> createState() => _IntroPageDesktopState();
}

class _IntroPageDesktopState extends State<IntroPageMobile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 308,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            OctoImage.fromSet(
              fit: BoxFit.cover,
              filterQuality: FilterQuality.medium,
              width: 128,
              height: 128,
              image: Image.asset("assets/image/patterns/my_photo.png").image,
              octoSet: OctoSet.circleAvatar(
                backgroundColor: Theme.of(context).colorPlate().yellow!,
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
                  ]),
                )),
            const SizedBox(
              height: 8,
            ),
            SelectableText(
              "Mobile developer",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 8,
            ),
            ButtonOutline(
              text: 'Завантажити резюме',
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
          ]),
    );
  }
}
