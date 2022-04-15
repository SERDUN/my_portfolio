import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:my_portfolio/presenter/common/extension/style/own_theme_fields.dart';
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> fetchData() => Future.delayed(const Duration(seconds: 2), () {
        return true;
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: Svg(
            "assets/image/patterns/bike.svg",
            size: Size(92, 80),
          ),
          repeat: ImageRepeat.repeat,
        )),
        height: 400,
        child: Stack(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 132,
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
                  text: 'Завантажити резюме',
                  onTap: ()async {
                    var url = "https://drive.google.com/file/d/1aZ-BcXJFSG8AjnjniG0OEM5NBzm8CMwk/view?usp=sharing";
                    await
                    canLaunch(url)
                        ? await launch(url)
                        : throw 'Could not launch $url';
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              child: OctoImage.fromSet(
                fit: BoxFit.cover,
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
            ),
          )
        ]),
      ),
      onTap: () {
        //  _showPhoto();
      },
    );
  }

  Widget buildPoint(String path, Function onTap) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(10.0),
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                color: Colors.black, shape: BoxShape.circle),
            child: Image.asset(path),
          ),
          onTap: () => onTap(),
        ));
  }
}
