import 'package:flutter/material.dart';
import 'package:my_portfolio/layers/presenter/common/extension/style/own_theme_fields.dart';
import 'package:octo_image/octo_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../domain/entity/model/user/portfolio_user_model.dart';
import '../../../../common/widgets/button/button_outline.dart';


class IntroPageMobile extends StatefulWidget {
  final PortfolioUserModel? userModel;

  const IntroPageMobile({required this.userModel, Key? key}) : super(key: key);

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
            widget.userModel?.avatar == null
                ? const SizedBox(
                    width: 128,
                    height: 128,
                  )
                : OctoImage.fromSet(
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.medium,
                    width: 128,
                    height: 128,
                    image: Image.network(widget.userModel!.avatar).image,
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
              text: '?????????????????????? ????????????',
              onTap: () async {
                await canLaunch(widget.userModel?.cv ?? "")
                    ? await launch(widget.userModel?.cv ?? "")
                    : throw 'Could not launch $widget.userModel?.cv??""';
              },
            ),
            const SizedBox(
              height: 8,
            ),
          ]),
    );
  }
}
