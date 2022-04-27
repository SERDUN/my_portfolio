import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectLinks extends StatelessWidget {
  final String android;
  final String ios;
  final String github;
  final EdgeInsets margin;
  final double iconSize;

  final MainAxisAlignment mainAxisAlignment;

  const ProjectLinks(
      {Key? key,
      required this.mainAxisAlignment,
      this.android = "",
      this.ios = "",
      this.github = "",
      this.margin = EdgeInsets.zero, this.iconSize=56})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(margin: margin,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Visibility(
              visible: github.isNotEmpty,
              child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                      onTap: () async {
                        await canLaunch(github)
                            ? await launch(github)
                            : throw 'Could not launch $github';
                      },
                      child: Image.asset(
                        "assets/image/icons/github.webp",
                        width: iconSize,
                        height: iconSize,
                      )))),
          Visibility(
              visible: github.isNotEmpty,
              child: const SizedBox(
                width: 24,
              )),
          Visibility(
              visible: android.isNotEmpty,
              child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                      onTap: () async {
                        await canLaunch(android)
                            ? await launch(android)
                            : throw 'Could not launch $android';
                      },
                      child: Image.asset(
                        "assets/image/social/google_play.webp",
                        width: iconSize,
                        height: iconSize,
                      )))),
          Visibility(
              visible: android.isNotEmpty,
              child: const SizedBox(
                width: 24,
              )),
          Visibility(
              visible: ios.isNotEmpty,
              child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                      onTap: () async {
                        await canLaunch(ios)
                            ? await launch(ios)
                            : throw 'Could not launch $ios';
                      },
                      child: Image.asset(
                        "assets/image/social/app_store.webp",
                        width: iconSize,
                        height: iconSize,
                      )))),
          Visibility(
              visible: ios.isNotEmpty,
              child: const SizedBox(
                width: 24,
              )),
        ],
      ),
    );
  }
}
