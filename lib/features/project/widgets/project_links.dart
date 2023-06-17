import 'package:flutter/widgets.dart';

class ProjectLinks extends StatelessWidget {
  final String android;
  final String ios;
  final String github;
  final EdgeInsets margin;
  final double iconSize;
  final Function(String) openLink;

  final MainAxisAlignment mainAxisAlignment;



  const ProjectLinks(
      {Key? key,
      required this.mainAxisAlignment,
      this.android = "",
      this.ios = "",
      this.github = "",
      required this.openLink,
      this.margin = EdgeInsets.zero,
      this.iconSize = 56})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          SocialPart(
            link: github,
            iconSize: iconSize,
            openLink: openLink,
            icon: "assets/image/icons/github.webp",
          ),
          SocialPart(
            link: android,
            iconSize: iconSize,
            openLink: openLink,
            icon: "assets/image/icons/google_play.webp",
          ),
          SocialPart(
            link: ios,
            iconSize: iconSize,
            openLink: openLink,
            icon: "assets/image/icons/app_store.webp",
          ),
        ],
      ),
    );
  }
}

class SocialPart extends StatelessWidget {
  const SocialPart({
    Key? key,
    required this.link,
    required this.iconSize,
    required this.openLink,
    required this.icon,
  }) : super(key: key);

  final String icon;
  final String link;
  final double iconSize;
  final Function(String) openLink;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: link.isNotEmpty,
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: () => openLink(link),
                child: Image.asset(
                  icon,
                  width: iconSize,
                  height: iconSize,
                ))));
  }
}
