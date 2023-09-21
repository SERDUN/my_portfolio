import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';

class ProjectLinks extends StatelessWidget {
  const ProjectLinks({
    Key? key,
    required this.mainAxisAlignment,
    this.android = "",
    this.ios = "",
    this.github = "",
    required this.onOpenLink,
    this.margin = EdgeInsets.zero,
    this.iconSize = 32,
  }) : super(key: key);

  final String android;
  final String ios;
  final String github;
  final EdgeInsets margin;
  final double iconSize;

  final Function(String) onOpenLink;

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Wrap(
        spacing: 16,
        children: [
          if (github.isNotEmpty)
            SocialPart(
              link: github,
              iconSize: iconSize,
              openLink: onOpenLink,
              icon: Ionicons.logo_github,
            ),
          if (android.isNotEmpty)
            SocialPart(
              link: android,
              iconSize: iconSize,
              openLink: onOpenLink,
              icon: Ionicons.logo_google_playstore,
            ),
          if (ios.isNotEmpty)
            SocialPart(
              link: ios,
              iconSize: iconSize,
              openLink: onOpenLink,
              icon: Ionicons.logo_apple_appstore,
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

  final IconData icon;
  final String link;
  final double iconSize;
  final Function(String) openLink;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => openLink(link),
        child: Icon(
          icon,
          size: iconSize,
        ),
      ),
    );
  }
}
