import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';

import '../../../config/constants.dart';
import '../../common/widgets/behaviour/responsive_widget.dart';
import '../../common/widgets/decoration/decoration_view.dart';
import '../../common/widgets/icon.dart';

class ContactUs extends StatefulWidget {
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
      desktopScreen: Container(
        // padding: EdgeInsets.symmetric(
        //   horizontal: MediaQuery.of(context).size.width * .15,
        //   vertical: 100,
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              'GET IN TOUCH',
              style: Theme.of(context).textTheme.headline1,
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
                          buildBuildContactInfo(context),
                          const SizedBox(height: 20),
                          buildBuildPhoneInfo(context),
                          const SizedBox(height: 20),
                          _buildLocationInfo(context),
                        ],
                      ),
                    )),
                SizedBox(width: MediaQuery.of(context).size.width/4,),
                Expanded(
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
              ],
            )
          ],
        ),
      ),
      mobileScreen: Container(
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
    return _buildContactInfo('image/icons/pin.png', 'Location:',
        AppConstants.location, Theme.of(context).textTheme.bodyText1!);
  }

  Widget buildBuildPhoneInfo(BuildContext context) {
    return _buildContactInfo('image/icons/call.png', 'Call Us:',
        AppConstants.phone, Theme.of(context).textTheme.bodyText1!);
  }

  Widget buildBuildContactInfo(BuildContext context) {
    return _buildContactInfo('image/icons/email.png', 'Mail Us:',
        AppConstants.mail, Theme.of(context).textTheme.bodyText1!);
  }

  Widget buildBuildFacebookInfo(BuildContext context) {
    return _buildContactInfo('image/social/facebook.png', 'Facebook',
        AppConstants.facebook, Theme.of(context).textTheme.bodyText1!);
  }

  Widget buildBuildLinkedinInfo(BuildContext context) {
    return _buildContactInfo('image/social/linkedin.png', 'Facebook',
        AppConstants.linkedin, Theme.of(context).textTheme.bodyText1!);
  }

  Widget buildBuildInstagramInfo(BuildContext context) {
    return _buildContactInfo('image/social/instagram.png', 'Instagram',
        AppConstants.instagram, Theme.of(context).textTheme.bodyText1!);
  }

  Widget _buildContactInfo(
      String imagePath, String title, String content, TextStyle textStyle) {
    return FittedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppIcon(imagePath, color: Colors.black.withOpacity(.7), size: 20),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                title,
                style: textStyle,
              ),
              const SizedBox(height: 5),
              SelectableText(
                content,
                style: TextStyle(color: Colors.black.withOpacity(.7)),
              ),
            ],
          )
        ],
      ),
    );
  }

  // Widget _buildContactForm(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Have Something To Write?',
  //         style: TextStyle(
  //           color: Colors.black,
  //           fontSize: 20,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       const SizedBox(height: 25),
  //       Form(
  //         key: _formKey,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: TextFormField(
  //                     validator: (text) {
  //                      // return (text!.isValidName())
  //                          true ? null
  //                           : 'Please insert valid name!';
  //                     },
  //                     decoration: InputDecoration(
  //                       hintText: 'Your Name',
  //                       border: OutlineInputBorder(),
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(width: 15),
  //                 Expanded(
  //                   child: TextFormField(
  //                     validator: (text) {
  //                     //  return (text!.isValidEmail)
  //                       return true
  //                           ? null
  //                           : 'Please insert valid email!';
  //                     },
  //                     decoration: InputDecoration(
  //                       hintText: 'Your Email',
  //                       border: OutlineInputBorder(),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(height: 20),
  //             TextFormField(
  //               minLines: 3,
  //               maxLines: 10,
  //               validator: (text) {
  //                 return true
  //               //  return (text!.isValidName(minLength: 10))
  //                     ? null
  //                     : 'Please insert valid message!, at least 10 characters';
  //               },
  //               decoration: InputDecoration(
  //                 hintText: 'Your Message',
  //                 border: OutlineInputBorder(),
  //               ),
  //             ),
  //             const SizedBox(height: 20),
  //             RaisedButton(
  //               color: Colors.yellow,
  //               textColor: Colors.white,
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
  //               onPressed:()=> _sendMail(),
  //               child: Text('Send'),
  //             ),
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
