import 'package:flutter/material.dart';
import 'package:my_portfolio/layers/presenter/common/extension/style/own_theme_fields.dart';
import 'package:octo_image/octo_image.dart';
import '../../../../../routes.dart';
import '../../../../domain/entity/model/model_project.dart';
import '../../../../domain/entity/model/projects/project_model.dart';
import '../../../common/widgets/behaviour/responsive_widget.dart';
import '../../../common/widgets/button/button_outline.dart';
import '../../../common/widgets/dash/dash_horizontal.dart';

class PortfolioItem extends StatelessWidget {
  final ProjectModel project;

  const PortfolioItem({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  height: MediaQuery.of(context).size.width * .3,
                  width: MediaQuery.of(context).size.width * .25,
                  child: _buildPreview(context),
                ),
                Expanded(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.width * .3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.width * .01,
                            ),
                            _buildTitleProject(context),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * .01,
                            ),
                            Container(
                              child: _buildProjectDescription(context),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 16, right: 40),
                              child: buildTechnology(context),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * .025,
                            ),
                            Flexible(
                                child: Align(
                              alignment: Alignment.bottomLeft,
                              child: ButtonOutline(
                                text: 'Open details',
                                onTap: () => _openDetails(context),
                              ),
                            )),

                            // ButtonFill(text:"Open", onTap: (){},)
                          ],
                        ))),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            DashHorizontal(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 40),
            )
          ],
        ),
      ),
      mobileScreen: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * .01,
            ),
            _buildTitleProject(context),
            // Container(
            //   margin: const EdgeInsets.only(bottom: 8, top: 8),
            //   child: buildTechnology(context),
            // ),
            Container(
              margin: const EdgeInsets.only(right: 24, top: 16),
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: _buildPreview(context),
            ),

            SizedBox(width: MediaQuery.of(context).size.width * .075),

            SizedBox(
              height: MediaQuery.of(context).size.width * .01,
            ),
            _buildProjectDescription(context),
            SizedBox(
              height: 24,
            ),
            ButtonOutline(
              text: 'Open details',
              onTap: () {
                _openDetails(context);
              },
            ),
            SizedBox(
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
      ),
    );
  }

  void _openDetails(BuildContext context) {
    Navigator.of(context, rootNavigator: true)
        .pushNamed(Routes.projectDetails, arguments: project.id);
  }

  Widget _buildProjectDescription(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 40),
      child: Text(
        project.description ?? "",
        maxLines: 3,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              overflow: TextOverflow.ellipsis,
            ),
      ),
    );
  }

  Widget _buildTitleProject(BuildContext context) {
    return InkWell(
      onTap: () => _openDetails(context),
      child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                project.name ?? "",
                style: Theme.of(context).textTheme.headline1,
              ))),
    );
  }

  Widget _buildPreview(BuildContext context) {
    return Card(
      elevation: 3,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
            onTap: () => _openDetails(context),
            child: Container(
                margin: const EdgeInsets.all(4),
                width: double.infinity,
                height: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: OctoImage(
                      image: Image.network(project.media?.preview?.url ?? "")
                          .image,
                      placeholderBuilder: OctoPlaceholder.blurHash(
                        'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                      ),
                      errorBuilder: OctoError.icon(color: Colors.red),
                      fit: _getBoxFit(),
                    )))),
      ),
    );
  }

  BoxFit _getBoxFit() {
    if (project.media?.preview.fitType == "cover") {
      return BoxFit.cover;
    }
    if (project.media?.preview.fitType == "fitWidth") {
      return BoxFit.fitWidth;
    }
    return BoxFit.fitHeight;
  }

  Wrap buildTechnology(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: (project.tags?.develop ?? [])
          .map((s) => Container(
                child: Text(
                  s,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.w100,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).colorPlate().grey),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(24),
                ),
              ))
          .toList(),
    );
  }
}
