import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

import '../../../../../domain/entity/model/projects/project_model.dart';
import '../../../../common/widgets/button/button_outline.dart';
import '../../../../common/widgets/chip/simple_chip.dart';
import '../../../../common/widgets/dash/dash_horizontal.dart';

class DesktopPortfolioItem extends StatelessWidget {
  final Function openDetails;
  final ProjectModel project;

  const DesktopPortfolioItem(
      {Key? key, required this.openDetails, required this.project})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                height: MediaQuery.of(context).size.width * .3,
                width: MediaQuery.of(context).size.width * .25,
                child: _buildProjectLogo(context),
              ),
               ButtonOutline(
                 corner: 8,
                 width: MediaQuery.of(context).size.width * .25,
                  text: 'Open details',
                  onTap: () => openDetails(),

              )
            ]),
            Expanded(
                child: SizedBox(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * .01,
                ),
                InkWell(
                  onTap: () => openDetails(),
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        project.name ?? "",
                        style: Theme.of(context).textTheme.headline1,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .01,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 40),
                  child: Text(
                    project.description ?? "",
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 16, right: 40),
                  child: buildTechnology(context),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .025,
                ),
              ],
            ))),
          ],
        ),
        DashHorizontal(
          width: MediaQuery.of(context).size.width,
          margin:  EdgeInsets.only(left:  MediaQuery.of(context).size.width * .32,right: 32),
        )
      ],
    );
  }

  Widget _buildProjectLogo(BuildContext context) {
    return Card(
      elevation: 3,
      child: InkWell(
          onTap: () => openDetails(),
          child: Container(
              margin: const EdgeInsets.all(4),
              width: double.infinity,
              height: double.infinity,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: OctoImage(
                      image:
                          Image.network(project.media?.preview.url ?? "").image,
                      placeholderBuilder: OctoPlaceholder.blurHash(
                        'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                      ),
                      errorBuilder: OctoError.icon(color: Colors.red),
                      fit: BoxFit.fitHeight)))),
    );
  }

  Wrap buildTechnology(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: (project.tags.develop).map((s) => SimpleChip(text: s)).toList(),
    );
  }
}
