import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/presenter/common/extension/style/own_theme_fields.dart';
import 'package:octo_image/octo_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../config/constants.dart';
import '../../../../domain/entity/model/model_project.dart';
import '../../../common/widgets/behaviour/responsive_widget.dart';
import '../../../common/widgets/dash/dash_horizontall.dart';
import '../../../common/widgets/dash/dash_vertical.dart';
import '../../../common/widgets/decoration/decoration_view.dart';
import '../../../common/widgets/icon.dart';
import '../../../common/widgets/bars/project_details_bar.dart';

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
      appBar: const ProjectDetailsBar(),
      body: SingleChildScrollView(
        child: ResponsiveWidget(
          desktopScreen: buildDesctop(context),
          mobileScreen: buildMobile(context),
        ),
      ),
    );
  }

  Widget buildDesctop(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.project.name.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                              ),
                              const DecorationViewLines(
                                margin: EdgeInsets.only(top: 0, bottom: 4),
                              ),
                            ],
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                      Expanded(
                        child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: Text(
                              widget.project.description.intro.toUpperCase(),
                              textAlign: TextAlign.right,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                      fontWeight: FontWeight.w100,
                                      color:
                                          Theme.of(context).colorPlate().grey),
                            )),
                      ),
                    ],
                  ),
                )),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                  visible: widget.project.androidLink != null,
                  child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                          onTap: () async {
                            var url = widget.project.androidLink ?? "";
                            await canLaunch(url)
                                ? await launch(url)
                                : throw 'Could not launch $url';
                          },
                          child: Image.asset(
                            "assets/image/social/google_play.png",
                            width: 56,
                            height: 56,
                          )))),
              Visibility(
                  visible: widget.project.androidLink != null,
                  child: const SizedBox(
                    width: 24,
                  )),
              Visibility(
                  visible: widget.project.appleLink != null,
                  child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                          onTap: () async {
                            var url = widget.project.appleLink ?? "";
                            await canLaunch(url)
                                ? await launch(url)
                                : throw 'Could not launch $url';
                          },
                          child: Image.asset(
                            "assets/image/social/app_store.png",
                            width: 56,
                            height: 56,
                          )))),
              Visibility(
                  visible: widget.project.appleLink != null,
                  child: const SizedBox(
                    width: 24,
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 88,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Description",
              style: Theme.of(context).textTheme.headline4,
            )),
        DashHorizontal(
          opacity: .5,
          dashSpace: 16,
          dashHeight: 16,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 16),
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 72),
              child: SelectableText(
                "",
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            )),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            widget.project.description.fullDescription,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Software stack",
              style: Theme.of(context).textTheme.headline4,
            )),
        DashHorizontal(
          opacity: .5,
          dashSpace: 16,
          dashHeight: 16,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 16, bottom: 16),
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Wrap(
                children: widget.project.tags.developmentTags
                    .map((e) => _buildTags(context, e))
                    .toList())),
        const SizedBox(
          height: 80,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Screenshots",
              style: Theme.of(context).textTheme.headline4,
            )),
        DashHorizontal(
          width: MediaQuery.of(context).size.width,
          opacity: .5,
          dashSpace: 16,
          dashHeight: 16,
          margin: const EdgeInsets.only(top: 16, bottom: 16),
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
      ],
    );
  }

  Widget buildMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            widget.project.name.toUpperCase(),
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        const Align(alignment: Alignment.center, child: DecorationViewLines()),
        const SizedBox(
          height: 8,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              widget.project.description.intro.toUpperCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: Theme.of(context).colorPlate().grey),
            )),
        const SizedBox(
          height: 80,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Description",
              style: Theme.of(context).textTheme.headline4,
            )),
        DashHorizontal(
          opacity: .5,
          dashSpace: 16,
          dashHeight: 16,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 8),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              child: Text(
                widget.project.description.fullDescription,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )),
        const SizedBox(
          height: 40,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Software stack",
              style: Theme.of(context).textTheme.headline4,
            )),
        DashHorizontal(
          opacity: .5,
          dashSpace: 16,
          dashHeight: 16,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 8),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.project.tags.developmentTags
                    .map((e) => _buildTags(context, e))
                    .toList()),
          ),
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: const SizedBox(
              height: 40,
            )),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Screenshots",
              style: Theme.of(context).textTheme.headline4,
            )),
        DashHorizontal(
          width: MediaQuery.of(context).size.width,
          opacity: .5,
          dashSpace: 16,
          dashHeight: 16,
          margin: const EdgeInsets.only(top: 16, bottom: 16),
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
    );
  }

  Row _buildTags(BuildContext context, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          padding: const EdgeInsets.only(left: 0),
          icon: Image.asset("assets/image/icons/sub_category.png",
              width: 24, height: 24),
          iconSize: 16,
          onPressed: null,
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          width: 24,
        ),
      ],
    );
  }
}
