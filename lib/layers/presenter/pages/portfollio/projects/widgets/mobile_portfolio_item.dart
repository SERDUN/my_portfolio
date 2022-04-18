import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

import '../../../../../domain/entity/model/projects/project_model.dart';
import '../../../../common/widgets/button/button_outline.dart';
import '../../../../common/widgets/dash/dash_horizontal.dart';

class MobilePortfolioItem extends StatelessWidget {
  final Function openDetails;
  final ProjectModel project;

  const MobilePortfolioItem(
      {Key? key, required this.openDetails, required this.project})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => openDetails(),
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  project.name ?? "",
                  style: Theme.of(context).textTheme.headline1,
                )),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * .075),
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
          _buildProjectLogo(context),
          const SizedBox(
            height: 24,
          ),
          ButtonOutline(
            width: double.infinity,
            text: 'Open details',
            onTap: () => openDetails(),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * .025,
          ),
          DashHorizontal(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.zero,
          )
        ],
      ),
    );
  }

  Widget _buildProjectLogo(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        height: 360,
        width: 200,
        // constraints: const BoxConstraints(maxWidth: 300,minHeight: 300),
        child: Card(
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
                                Image.network(project.media?.preview.url ?? "")
                                    .image,
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                            ),
                            errorBuilder: OctoError.icon(color: Colors.red),
                            fit: BoxFit.cover))))),
      ),
    );
  }
}
