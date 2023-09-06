import 'package:flutter/material.dart';
import 'package:my_portfolio/localization/localization.dart';

import 'package:octo_image/octo_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/widgets/widgets.dart';

import 'project_links.dart';

class DesktopProjectDetailsPage extends StatelessWidget {
  const DesktopProjectDetailsPage({
    Key? key,
    required this.project,
    required this.onOpenLink,
  }) : super(key: key);

  final ProjectModel project;
  final Function(String) onOpenLink;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
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
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    (project.name ?? "").toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(fontStyle: FontStyle.italic),
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
                                  (project.intro ?? "").toUpperCase(),
                                  textAlign: TextAlign.right,
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
            Container(
              margin: const EdgeInsets.only(right: 16),
              height: 56,
              child: ProjectLinks(
                mainAxisAlignment: MainAxisAlignment.end,
                android: project.linkAndroid,
                ios: project.linkIOS,
                github: project.linkSource,
                onOpenLink: onOpenLink,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 64,
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                context.l10n.portfolio_description,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const Expanded(
              child: DashHorizontal(
                margin: EdgeInsets.only(top: 8),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            project.description ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        Row(
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Стек залежностей",
                  style: Theme.of(context).textTheme.headlineSmall,
                )),
            const Expanded(
              child: DashHorizontal(
                margin: EdgeInsets.only(top: 8),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Wrap(children: (project.technologies).map((e) => _buildTags(context, e)).toList())),
        const SizedBox(
          height: 64,
        ),
        Row(
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Скріншоти",
                  style: Theme.of(context).textTheme.headlineSmall,
                )),
            const Expanded(
              child: DashHorizontal(
                margin: EdgeInsets.only(top: 8),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
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
          itemCount: project.screenshots.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 4,
                child: Padding(
                  child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(4.0)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: OctoImage(
                        image: Image.network(project.screenshots[itemIndex]).image,
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                        ),
                        errorBuilder: OctoError.icon(color: Colors.red),
                        fit: BoxFit.scaleDown,
                      )),
                  padding: const EdgeInsets.all(8),
                ),
              ),
            );
          },
        )),
      ],
    );
  }

  Widget _buildTags(BuildContext context, String text) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Image.asset(
                "assets/image/icons/category.webp",
                width: 24,
                height: 24,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              padding: const EdgeInsets.all(8),
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}
