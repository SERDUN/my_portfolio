import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/widgets/widgets.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({
    Key? key,
    required this.contactsModel,
  }) : super(key: key);

  final ContactsModel contactsModel;

  @override
  _ContactMeState createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            tr("contact_get_in_touch"),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const DecorationViewLines(),
          const SizedBox(
            height: 80,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    buildBuildFacebookInfo(context, width: MediaQuery.of(context).size.width / 3),
                    const SizedBox(height: 24),
                    buildBuildLinkedinInfo(context, width: MediaQuery.of(context).size.width / 3),
                    const SizedBox(height: 24),
                    buildBuildInstagramInfo(context, width: MediaQuery.of(context).size.width / 3),
                  ],
                ),
              ),
              const DashVertical(
                height: 224,
                margin: EdgeInsets.symmetric(horizontal: 40),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildBuildContactInfo(context, width: MediaQuery.of(context).size.width / 3),
                  const SizedBox(height: 24),
                  buildBuildPhoneInfo(context, width: MediaQuery.of(context).size.width / 3),
                  const SizedBox(height: 24),
                  _buildLocationInfo(context, width: MediaQuery.of(context).size.width / 3),
                ],
              )),
            ],
          )
        ],
      ),
      mobileScreen: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                tr("contact_get_in_touch").toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            const DecorationViewLines(),
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildBuildContactInfo(context),
                const SizedBox(height: 20),
                buildBuildPhoneInfo(context),
                const SizedBox(height: 20),
                _buildLocationInfo(context),
                const SizedBox(height: 20),
                buildBuildFacebookInfo(context, isInvert: false),
                const SizedBox(height: 20),
                buildBuildLinkedinInfo(context, isInvert: false),
                const SizedBox(height: 20),
                buildBuildInstagramInfo(context, isInvert: false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationInfo(BuildContext context, {double? width}) {
    return IconText(
      imagePath: 'assets/image/icons/location.webp',
      title: tr("contact_location"),
      content: widget.contactsModel.location,
      url: widget.contactsModel.location,
      type: IconTextType.selectable,
      width: width,
      call: launchLink,
    );
  }

  Widget buildBuildPhoneInfo(BuildContext context, {double? width}) {
    return IconText(
      imagePath: 'assets/image/icons/phone.webp',
      title: tr("contact_phone"),
      content: widget.contactsModel.phone,
      url: widget.contactsModel.phone,
      type: IconTextType.selectable,
      width: width,
      call: launchLink,
    );
  }

  Widget buildBuildContactInfo(BuildContext context, {double? width}) {
    return IconText(
      imagePath: 'assets/image/icons/mail.webp',
      title: tr("contact_email"),
      content: widget.contactsModel.mail,
      url: widget.contactsModel.mail,
      type: IconTextType.selectable,
      width: width,
      call: launchLink,
    );
  }

  Widget buildBuildFacebookInfo(BuildContext context, {bool isInvert = true, double? width}) {
    return IconText(
      imagePath: 'assets/image/icons/facebook.webp',
      title: tr("contact_facebook"),
      content: widget.contactsModel.facebookUsername,
      url: widget.contactsModel.facebookLink,
      width: width,
      isInverted: isInvert,
      call: launchLink,
    );
  }

  Widget buildBuildLinkedinInfo(BuildContext context, {bool isInvert = true, double? width}) {
    return IconText(
      imagePath: 'assets/image/icons/linkedin.webp',
      title: tr("contact_linkedin"),
      content: widget.contactsModel.linkedinUsername,
      url: widget.contactsModel.linkedinLink,
      width: width,
      isInverted: isInvert,
      call: launchLink,
    );
  }

  Widget buildBuildInstagramInfo(BuildContext context, {bool isInvert = true, double? width}) {
    return IconText(
      imagePath: 'assets/image/icons/instagram.webp',
      title: tr("contact_instagram"),
      content: widget.contactsModel.instagramUsername,
      url: widget.contactsModel.instagramLink,
      width: width,
      isInverted: isInvert,
      call: launchLink,
    );
  }

  void launchLink(String url) async {
    final link = Uri.tryParse(url);
    if (link != null) await canLaunchUrl(link) ? launchUrl(link) : throw 'Could not launch $link';
  }
}
