import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import '../../../../config/constants.dart';
import '../../../common/widgets/behaviour/responsive_widget.dart';
import '../../../common/widgets/dash/dash_horizontall.dart';
import '../../../common/widgets/dash/dash_vertical.dart';
import '../../../common/widgets/decoration/decoration_view.dart';
import '../../../common/widgets/icon.dart';
import '../../../ui/menu/project_details_bar.dart';

class ProjectDetailsPage extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ProjectDetailsPage> {
  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];
  late PageController _pageController;
  int activePage = 1;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.8);
    super.initState();
  }

  final _nameController = TextEditingController(),
      _emailController = TextEditingController(),
      _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProjectDetailsBar(),
      body: SingleChildScrollView(
        child: ResponsiveWidget(
          desktopScreen: Container(
            // padding: EdgeInsets.symmetric(
            //   horizontal: MediaQuery.of(context).size.width * .15,
            //   vertical: 100,
            // ),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  child: Text(
                    'Alias'.toUpperCase(),
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                const DecorationViewLines(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 72),
                  child: SelectableText(
                    "Alias or Charades - guess word board game is a new free version of the world-famous activity Alias board game. The objective of Alias is to explain words to team members.",
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            "Alias or Charades - guess word board game is a new free version of the world-famous activity Alias board game. The objective of Alias is to explain words to team members. For each word that's correctly guessed by one of your teammates, your team gets a point. Our app lets you play Alias anywhere without a ton of paper cards and a board. Catch new features! Steelkiwi has released a web version of the Alias or Charades game where you can comfortably add your own word sets and use them on your phone. Now you could add set on any language. Play your own sets with your friends or share it to all word. Cool, isn’t it? Check it out here: https://getalias.co/ The best feature of free Alias is it's themed sets of words. We’ve already prepared Space, Party and Food sets. We’re planning to make lots more soon. You can also play the standard Alias to set your difficulty level and play with a random set of words. A separate Alias game mode for kids with pictures alongside words is also available in this version. Alias is an awesome game for both small and large groups. Having a party or a picnic? Don’t know what to do with your family on a rainy day? You could play Alias. It’s great for all ages. All you need is at least four people and the app.",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          height: 400,
                        )),
                    Align(
                      alignment: Alignment.topCenter,
                      child: DashVertical(
                        height: 224,
                      ),
                    ),
                    Flexible(
                        child: Container(
                      child: Column(
                        children: [
                          _buildTags(context, "Android"),
                          _buildTags(context, "RX"),
                          _buildTags(context, "Jetpak"),
                          _buildTags(context, "Koin"),
                          _buildTags(context, "Room"),
                        ],
                      ),
                      height: 400,
                    )),
                  ],
                ),
                GestureDetector(
                  child: Text(
                    'Screenshots'.toUpperCase(),
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                DashHorizontal(width: 80,margin: EdgeInsets.only(top: 8),),
                SizedBox(
                    child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.width / 3,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.5,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  itemCount: 15,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Padding(
                      padding: EdgeInsets.all(16),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 4,
                        child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(4.0)),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: OctoImage(
                              image: Image.network(
                                      'https://blurha.sh/assets/images/img1.jpg')
                                  .image,
                              placeholderBuilder: OctoPlaceholder.blurHash(
                                'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                              ),
                              errorBuilder: OctoError.icon(color: Colors.red),
                              fit: BoxFit.cover,
                            )),
                      ),
                    );
                  },
                )),
                SizedBox(
                  height: 40,
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
                    '',
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
        ),
      ),
    );
  }

  Row _buildTags(BuildContext context, String text) {
    return Row(
      children: [
        Container(
          child: IconButton(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 0),
            icon: Image.asset("assets/image/icons/sub_category.png",
                width: 24, height: 24),
            iconSize: 16,
            onPressed: null,
          ),
          margin: const EdgeInsets.only(
            left: 16,
            right: 8,
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.headline5,
        )
      ],
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
