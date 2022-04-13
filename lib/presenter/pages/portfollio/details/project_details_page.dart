import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import '../../../../config/constants.dart';
import '../../../../domain/entity/model/model_project.dart';
import '../../../common/widgets/behaviour/responsive_widget.dart';
import '../../../common/widgets/dash/dash_horizontall.dart';
import '../../../common/widgets/dash/dash_vertical.dart';
import '../../../common/widgets/decoration/decoration_view.dart';
import '../../../common/widgets/icon.dart';
import '../../../ui/menu/project_details_bar.dart';

class ProjectDetailsPage extends StatefulWidget {
  final ModelProject project;

  const ProjectDetailsPage({Key? key, required this.project}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ProjectDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProjectDetailsBar(),
      body: SingleChildScrollView(
        child: ResponsiveWidget(
          desktopScreen: buildDesctop(context),
          mobileScreen: buildMobile(context),
        ),
      ),
    );
  }

  Container buildDesctop(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            child: Text(
              widget.project.name.toUpperCase(),
              style: Theme.of(context).textTheme.headline1,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const DecorationViewLines(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 72),
            child: SelectableText(
              "",
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
                  flex: 4,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      widget.project.description.fullDescription,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    height: 400,
                  )),
              const Align(
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
          const DashHorizontal(
            width: 80,
            margin: EdgeInsets.only(top: 8, bottom: 40),
          ),
          SizedBox(
              child: CarouselSlider.builder(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.width / 2,
              aspectRatio: 9 / 16,
              viewportFraction: 0.25,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            itemCount: widget.project.media.screenshots.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              return SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 4,
                  child: Padding(
                    child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(4.0)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: OctoImage(
                          image: Image.network(
                                  widget.project.media.screenshots[itemIndex])
                              .image,
                          placeholderBuilder: OctoPlaceholder.blurHash(
                            'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                          ),
                          errorBuilder: OctoError.icon(color: Colors.red),
                          fit: BoxFit.scaleDown,
                        )),
                    padding: EdgeInsets.all(8),
                  ),
                ),
              );
            },
          )),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  Container buildMobile(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            child: Text(
              widget.project.name.toUpperCase(),
              style: Theme.of(context).textTheme.headline1,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const DecorationViewLines(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 72),
            child: SelectableText(
              "",
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              widget.project.description.fullDescription,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedBox(height: 40,),
          DashHorizontal(
            width: 224,
          ),
          SizedBox(height: 40,),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _buildTags(context, "Android"),
                _buildTags(context, "RX"),
                _buildTags(context, "Jetpak"),
                _buildTags(context, "Koin"),
                _buildTags(context, "Room"),
              ],
            ),
          ),
          const SizedBox(height: 40,),

          GestureDetector(
            child: Text(
              'Screenshots'.toUpperCase(),
              style: Theme.of(context).textTheme.headline1,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const DashHorizontal(
            width: 80,
            margin: EdgeInsets.only(top: 8, bottom: 40),
          ),
          SizedBox(
              child: CarouselSlider.builder(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.width / 2,
              aspectRatio: 9 / 16,
              viewportFraction: 0.25,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            itemCount: widget.project.media.screenshots.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              return SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 4,
                  child: Padding(
                    child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(4.0)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: OctoImage(
                          image: Image.network(
                                  widget.project.media.screenshots[itemIndex])
                              .image,
                          placeholderBuilder: OctoPlaceholder.blurHash(
                            'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                          ),
                          errorBuilder: OctoError.icon(color: Colors.red),
                          fit: BoxFit.scaleDown,
                        )),
                    padding: EdgeInsets.all(8),
                  ),
                ),
              );
            },
          )),
          SizedBox(
            height: 40,
          )
        ],
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
}
