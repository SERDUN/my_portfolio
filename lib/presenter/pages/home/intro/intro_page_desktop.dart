import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common/widgets/button/button_outline.dart';
import '../../../common/widgets/dash/dash_vertical.dart';

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
    return GestureDetector(
      child: SizedBox(
        height: 328,
        child: Stack(children: [
          buildPhoto(context),
          Center(
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
          ),
          const DashVertical(
            height: 328,
            opacity: .7,
            horizontalRepeatCount: 9,
            margin: EdgeInsets.only(left: 40),
          ),
          const DashVertical(
            height: 328,
            opacity: .7,
            horizontalRepeatCount: 9,
            margin: EdgeInsets.only(left: 124),
          ),
          const DashVertical(
            height: 328,
            opacity: .7,
            horizontalRepeatCount: 9,
            margin: EdgeInsets.only(left: 208),
          ),
        ]),
      ),
      onTap: () {
        //  _showPhoto();
      },
    );
  }

  Widget buildPhoto(BuildContext context) {
    var animation = Lottie.asset('assets/animation/circle_animation.json',
        options: LottieOptions(enableMergePaths: true),
        width: 224,
        height: 224);

    var photo = Image.asset(
      "assets/image/patterns/my_photo.png",
      width: 224,
      height: 224,
      fit: BoxFit.cover,
    );

    return FutureBuilder<bool>(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              controller.forward();
            });
            return Align(
                alignment: Alignment.bottomRight,
                child: SlideTransition(
                  position: offset,
                  child: Container(
                      margin: const EdgeInsets.only(right: 32),
                      child: Stack(children: [
                        Container(
                            transform: Matrix4Transform()
                                .scale(2.5)
                                .translate(x: -160, y: -64)
                                .matrix4,
                            child: animation),
                        photo
                      ])),
                ));
          } else {
            return const SizedBox();
          }
        });
  }
}
