import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/layers/domain/entity/model/projects/project_model.dart';
import 'package:my_portfolio/layers/presenter/common/extension/style/own_theme_fields.dart';
import 'package:my_portfolio/layers/presenter/pages/host/pages/portfolio/details/widgets/project_links.dart';
import 'package:octo_image/octo_image.dart';

import '../../../../../../common/widgets/dash/dash_horizontal.dart';
import '../../../../../../common/widgets/decoration/decoration_view.dart';

class MobileProjectDetailsPage extends StatelessWidget {
  final ProjectModel project;

  const MobileProjectDetailsPage({Key? key, required this.project})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            (project.name ?? "").toUpperCase(),
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        const Align(alignment: Alignment.center, child: DecorationViewLines()),
        const SizedBox(
          height: 8,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              (project.intro ?? ""),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: Theme.of(context).colorPlate().grey),
            )),
        const SizedBox(
          height: 40,
        ),
        ProjectLinks(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          iconSize: 40,
          mainAxisAlignment: MainAxisAlignment.end,
          android: project.linkAndroid,
          ios: project.linkIOS,
          github: project.linkSource,
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              tr("portfolio_description"),
              style: Theme.of(context).textTheme.headline4,
            )),
        DashHorizontal(
          opacity: .5,
          dashSpace: 16,
          dashHeight: 16,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 8),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              child: Text(
                project.description ?? "",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )),
        const SizedBox(
          height: 40,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Software stack",
              style: Theme.of(context).textTheme.headline4,
            )),
        DashHorizontal(
          opacity: .5,
          dashSpace: 16,
          dashHeight: 16,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 8),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (project.tags.develop)
                  .map((e) => _buildTags(context, e))
                  .toList()),
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: const SizedBox(
              height: 40,
            )),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
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
          itemCount: project.media?.screenshots.length,
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
                                project.media?.screenshots[itemIndex]?.url ??
                                    "")
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
        const SizedBox(
          height: 40,
        )
      ],
    );
  }

  Row _buildTags(BuildContext context, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Text(
            " - ",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: FontWeight.w100,
                color: Theme.of(context).colorPlate().orange),
          ),
          padding: const EdgeInsets.all(8),
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
