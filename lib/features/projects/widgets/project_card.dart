import 'package:material_ui/material_ui.dart';

import 'package:go_router/go_router.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/app/app_route_consts.dart';
import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/style/style.dart';

/// Vertical project card: phone screenshot in a well, name with the platform
/// tag, the intro and up to three technology tags. Opens the project page.
class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
    this.frameHeight = 300,
    this.maxTags = 3,
  });

  final ProjectModel project;
  final double frameHeight;
  final int maxTags;

  static void open(BuildContext context, ProjectModel project) {
    final id = project.id;
    if (id == null) return;
    GoRouter.of(context).goNamed(AppRoutInfo.project.name, pathParameters: {AppRoutInfo.projectId: id});
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final textTheme = Theme.of(context).textTheme;
    final platform = project.platform;
    final tags = project.technologies.where((t) => t.toLowerCase() != platform?.toLowerCase()).take(maxTags).toList();
    final name = project.name ?? '';

    return Semantics(
      button: true,
      label: name,
      child: Material(
        color: palette.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
          side: BorderSide(color: palette.line),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => open(context, project),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PhoneFrame(imageUrl: project.preview, height: frameHeight, semanticLabel: name),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: Text(name, style: textTheme.headlineSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                    if (platform != null) ...[const SizedBox(width: 12), PlatformTag(platform)],
                  ],
                ),
                if ((project.intro ?? '').isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Text(
                    project.intro!,
                    style: textTheme.bodySmall,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                if (tags.isNotEmpty) ...[
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [for (final tag in tags) TagChip(tag, style: TagChipStyle.outlined, small: true)],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
