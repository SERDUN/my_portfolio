import 'package:flutter/material.dart';
import 'package:my_portfolio/layers/domain/entity/model/contact/contacts_model.dart';
import 'package:my_portfolio/layers/presenter/common/widgets/dash/dash_vertical.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/widgets/behaviour/responsive_widget.dart';
import '../../../../common/widgets/decoration/decoration_view.dart';
import '../../../../common/widgets/text/icon_text.dart';


class ContactMe extends StatefulWidget {
  final ContactsModel contactsModel;

  const ContactMe({Key? key, required this.contactsModel}) : super(key: key);

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
            'GET IN TOUCH',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2,
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
                    buildBuildFacebookInfo(context,
                        width: MediaQuery.of(context).size.width / 3),
                    const SizedBox(height: 24),
                    buildBuildLinkedinInfo(context,
                        width: MediaQuery.of(context).size.width / 3),
                    const SizedBox(height: 24),
                    buildBuildInstagramInfo(context,
                        width: MediaQuery.of(context).size.width / 3),
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
                  buildBuildContactInfo(context,
                      width: MediaQuery.of(context).size.width / 3),
                  const SizedBox(height: 24),
                  buildBuildPhoneInfo(context,
                      width: MediaQuery.of(context).size.width / 3),
                  const SizedBox(height: 24),
                  _buildLocationInfo(context,
                      width: MediaQuery.of(context).size.width / 3),
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
                'GET IN TOUCH',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
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
      title: 'Location:',
      content: widget.contactsModel.location,
      url: widget.contactsModel.location,
      type: IconTextType.selectable,
      width: width,
      call: launchUrl,
    );
  }

  Widget buildBuildPhoneInfo(BuildContext context, {double? width}) {
    return IconText(
      imagePath: 'assets/image/icons/phone.webp',
      title: 'Call Me:',
      content: widget.contactsModel.phone,
      url: widget.contactsModel.phone,
      type: IconTextType.selectable,
      width: width,
      call: launchUrl,
    );
  }

  Widget buildBuildContactInfo(BuildContext context, {double? width}) {
    return IconText(
      imagePath: 'assets/image/icons/mail.webp',
      title: 'Mail Me:',
      content: widget.contactsModel.mail,
      url: widget.contactsModel.mail,
      type: IconTextType.selectable,
      width: width,
      call: launchUrl,
    );
  }

  Widget buildBuildFacebookInfo(BuildContext context,
      {bool isInvert = true, double? width}) {
    return IconText(
      imagePath: 'assets/image/icons/facebook.webp',
      title: 'Facebook',
      content: widget.contactsModel.facebookUsername,
      url: widget.contactsModel.facebookLink,
      width: width,
      isInverted: isInvert,
      call: launchUrl,
    );
  }

  Widget buildBuildLinkedinInfo(BuildContext context,
      {bool isInvert = true, double? width}) {
    return IconText(
      imagePath: 'assets/image/icons/linkedin.webp',
      title: 'Linkedin',
      content: widget.contactsModel.linkedinUsername,
      url: widget.contactsModel.linkedinLink,
      width: width,
      isInverted: isInvert,
      call: launchUrl,
    );
  }

  Widget buildBuildInstagramInfo(BuildContext context,
      {bool isInvert = true, double? width}) {
    return IconText(
      imagePath: 'assets/image/icons/instagram.webp',
      title: 'Instagram',
      content: widget.contactsModel.instagramUsername,
      url: widget.contactsModel.instagramLink,
      width: width,
      isInverted: isInvert,
      call: launchUrl,
    );
  }

  void launchUrl(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }
}
