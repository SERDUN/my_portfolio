import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:my_portfolio/config/typography.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  // Timer? t;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    offset = Tween<Offset>(end: Offset.zero, begin: const Offset(0.0, 1.0))
        .animate(controller);

    // _showDelayPhoto();

    // WidgetsBinding.instance?.addPostFrameCallback((_) {

    // });
    super.initState();
  }

  @override
  void dispose() {
    // t?.cancel();
    controller.dispose();
    super.dispose();
  }

  // void _showDelayPhoto() async {
  //   t = Timer(const Duration(seconds: 2), () {
  //   });
  // }

  void _showPhoto() {
    switch (controller.status) {
      case AnimationStatus.completed:
        controller.reverse();
        break;
      case AnimationStatus.dismissed:
        controller.forward();
        break;
      default:
    }
  }

  void _hidePhoto() {
    switch (controller.status) {
      case AnimationStatus.completed:
        controller.reverse();
        break;
      case AnimationStatus.dismissed:
        controller.forward();
        break;
      default:
    }
  }

  Future<bool> fetchData() => Future.delayed(const Duration(seconds: 2), () {
        return true;
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 240,
        child: Stack(children: [
          Image(
            width: double.infinity,height: double.infinity,
            image: const Svg(
              "assets/image/patterns/bike.svg",
              size: Size(92, 80),
            ),
            repeat: ImageRepeat.repeat,
            color: Colors.black.withOpacity(0.1),
          ),
          buildPhoto(context),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                DefaultTextStyle(
                    style: buttonTextStyle24White.copyWith(
                        fontWeight: FontWeight.w900),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      pause: const Duration(seconds: 1),
                      animatedTexts: [
                        TypewriterAnimatedText('Привіт',
                            speed: const Duration(milliseconds: 500)),
                        TypewriterAnimatedText('Hello',
                            speed: const Duration(milliseconds: 500)),
                        TypewriterAnimatedText('Ola',
                            speed: const Duration(milliseconds: 500)),
                        TypewriterAnimatedText('Fuck russia',
                            speed: const Duration(milliseconds: 50)),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    )),
                const SizedBox(
                  height: 16,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'I am ',
                    style: buttonTextStyle24White.copyWith(
                        fontWeight: FontWeight.normal),
                  ),
                  TextSpan(
                    text: 'Mobile Developer',
                    style: buttonTextStyle24White.copyWith(
                        fontWeight: FontWeight.w700),
                  ),
                ])),
                const SizedBox(
                  height: 24,
                ),
                buildSocial()
              ],
            ),
          ),
        ]),
      ),
      onTap: () {
        //  _showPhoto();
      },
    );
  }

  Row buildSocial() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildPoint("assets/image/social/facebook.png"),
        buildPoint("assets/image/social/gmail.png"),
        buildPoint("assets/image/social/instagram.png"),
        buildPoint("assets/image/social/linkedin.png"),
      ],
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
              _showPhoto();
            });
            return Opacity(
                opacity: (MediaQuery.of(context).size.width < 650) ? 0.0 : 1.0,
                child: Align(
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
                    )));
          } else {
            return const SizedBox();
          }
        });
  }

  Widget buildPoint(String path) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(10.0),
      width: 40,
      height: 40,
      decoration:
          const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
      child: Image.asset(path),
    );
  }
}
