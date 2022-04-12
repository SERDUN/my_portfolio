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
            const SizedBox(height: 32,),
            Text(
              'GET IN TOUCH',style: Theme.of(context).textTheme.headline1,
            ),
            const DecorationViewLines(),
            const SizedBox(height: 40,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child:  Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/5),
                    child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildContactInfo(
                        'image/icons/email.png',
                        'Mail Us:',
                        AppConstants.mail,
                      ),
                      const SizedBox(height: 20),
                      _buildContactInfo(
                        'image/icons/call.png',
                        'Call Us:',
                        AppConstants.phone,
                      ),
                      const SizedBox(height: 20),
                      _buildContactInfo(
                        'image/icons/pin.png',
                        'Visit Us:',
                        AppConstants.location,
                      ),
                    ],
                  ),
                )),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildContactInfo(
                          'image/icons/email.png',
                          'Mail Us:',
                          AppConstants.mail,
                        ),
                        const SizedBox(height: 20),
                        _buildContactInfo(
                          'image/icons/call.png',
                          'Call Us:',
                          AppConstants.phone,
                        ),
                        const SizedBox(height: 20),
                        _buildContactInfo(
                          'image/icons/pin.png',
                          'Visit Us:',
                          AppConstants.location,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      mobileScreen: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 100,
        ),
        child: Column(
          children: [
            Text(
              'GET IN TOUCH',
              textAlign: TextAlign.center,
            ),
            Container(
              width: 75,
              height: 2,
            ),
            const SizedBox(height: 3),
            Container(
              width: 50,
              height: 2,
            ),
            const SizedBox(height: 50),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContactInfo(
                      'icons/email.png',
                      'Mail Us:',
                      AppConstants.mail,
                    ),
                    const SizedBox(height: 20),
                    _buildContactInfo(
                      'icons/call.png',
                      'Call Us:',
                      AppConstants.phone,
                    ),
                    const SizedBox(height: 20),
                    _buildContactInfo(
                      'icons/pin.png',
                      'Visit Us:',
                      AppConstants.location,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildContactInfo(
                        'image/icons/email.png',
                        'Mail Us:',
                        AppConstants.mail,
                      ),
                      const SizedBox(height: 20),
                      _buildContactInfo(
                        'image/icons/call.png',
                        'Call Us:',
                        AppConstants.phone,
                      ),
                      const SizedBox(height: 20),
                      _buildContactInfo(
                        'image/icons/pin.png',
                        'Visit Us:',
                        AppConstants.location,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(String imagePath, String title, String content) {
    return FittedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppIcon(imagePath, color: Colors.black.withOpacity(.7), size: 20),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
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
