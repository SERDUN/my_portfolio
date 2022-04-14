import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:my_portfolio/config/typography.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/widgets/button/button_outline.dart';
import '../../../common/widgets/dash/dash_vertical.dart';
import '../../../common/widgets/decoration/decoration_view.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
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

  void _showPhoto() {
    // switch (controller.status) {
    //   case AnimationStatus.completed:
    controller.forward();
    //     break;
    //   case AnimationStatus.dismissed:
    //     controller.forward();
    //     break;
    //   default:
    // }
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
                // SelectableText("Dmitro Serdun",style: Theme.of(context).textTheme.headline3,),

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
                  onTap: () {},
                ),
                const SizedBox(
                  height: 8,
                ),
                const DashVertical(
                  height: 72,
                ),

                // buildSocial()
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
        buildPoint("assets/image/social/facebook.png", () {
          _launchURL();
        }),
        buildPoint("assets/image/social/gmail.png", () {
          _launchURL();
        }),
        buildPoint("assets/image/social/instagram.png", () {
          _launchURL();
        }),
        buildPoint("assets/image/social/linkedin.png", () {
          _launchURL();
        }),
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

  void _launchURL() async {
    if (!await launch("https://www.facebook.com/100014314170900"))
      throw 'Could not launch https://www.facebook.com/100014314170900"';
  }
}
