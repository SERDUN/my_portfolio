import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constants.dart';
import '../../common/widgets/behaviour/responsive_widget.dart';
import '../../common/widgets/decoration/decoration_view.dart';
import '../../common/widgets/icon.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController(),
      _emailController = TextEditingController(),
      _contentController = TextEditingController();

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
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildBuildFacebookInfo(context),
                      const SizedBox(height: 20),
                      buildBuildLinkedinInfo(context),
                      const SizedBox(height: 20),
                      buildBuildInstagramInfo(context),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildBuildContactInfo(context),
                  const SizedBox(height: 20),
                  buildBuildPhoneInfo(context),
                  const SizedBox(height: 20),
                  _buildLocationInfo(context),
                ],
              )),
            ],
          )
        ],
      ),
      mobileScreen: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        color: Colors.white,
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
            Wrap(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildBuildContactInfo(context),
                    const SizedBox(height: 20),
                    buildBuildPhoneInfo(context),
                    const SizedBox(height: 20),
                    _buildLocationInfo(context),
                    const SizedBox(height: 20),
                    buildBuildFacebookInfo(context),
                    const SizedBox(height: 20),
                    buildBuildLinkedinInfo(context),
                    const SizedBox(height: 20),
                    buildBuildInstagramInfo(context),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLocationInfo(BuildContext context) {
    return _buildContactInfoSelectable(
        'image/icons/pin.webp',
        'Location:',
        AppConstants.location,
        AppConstants.location,
        Theme.of(context).textTheme.bodyText1!);
  }

  Widget buildBuildPhoneInfo(BuildContext context) {
    return _buildContactInfoSelectable(
        'image/icons/call.webp',
        'Call Me:',
        AppConstants.phone,
        AppConstants.phone,
        Theme.of(context).textTheme.bodyText1!);
  }

  Widget buildBuildContactInfo(BuildContext context) {
    return _buildContactInfoSelectable(
        'image/icons/email.webp',
        'Mail Me:',
        AppConstants.mail,
        AppConstants.mail,
        Theme.of(context).textTheme.bodyText1!);
  }

  Widget buildBuildFacebookInfo(BuildContext context) {
    return _buildContactInfo(
        'image/social/facebook.webp',
        'Facebook',
        AppConstants.facebook,
        AppConstants.facebookUrl,
        Theme.of(context).textTheme.bodyText1!);
  }

  Widget buildBuildLinkedinInfo(BuildContext context) {
    return _buildContactInfo(
        'image/social/linkedin.webp',
        'Linkedin',
        AppConstants.linkedin,
        AppConstants.linkedinUrl,
        Theme.of(context).textTheme.bodyText1!);
  }

  Widget buildBuildInstagramInfo(BuildContext context) {
    return _buildContactInfo(
        'image/social/instagram.webp',
        'Instagram',
        AppConstants.instagram,
        AppConstants.instagramUrl,
        Theme.of(context).textTheme.bodyText1!);
  }

  Widget _buildContactInfo(String imagePath, String title, String content,
      String url, TextStyle textStyle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppIcon(imagePath, color: Colors.black.withOpacity(.7), size: 20),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 5),
            SelectableText.rich(
              TextSpan(
                text: content,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(fontStyle: FontStyle.normal),
                mouseCursor: SystemMouseCursors.click,
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await canLaunch(url)
                        ? await launch(url)
                        : throw 'Could not launch $url';
                  },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildContactInfoSelectable(String imagePath, String title,
      String content, String url, TextStyle textStyle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppIcon(imagePath, color: Colors.black.withOpacity(.7), size: 20),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                launch(url);
              },
              child: SelectableText(
                content,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(fontStyle: FontStyle.normal),
              ),
            ),

            // child: SelectableText(
            //   content,
            //   style: TextStyle(color: Colors.black.withOpacity(.7)),
            // ),
          ],
        )
      ],
    );
  }

  // FittedBox(
  // child:

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
