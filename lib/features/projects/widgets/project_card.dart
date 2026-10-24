import 'package:material_ui/material_ui.dart';

import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/app/app_route_consts.dart';
import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

enum ProjectCardLayout {
  /// Screenshot on top, text below: the home page grid.
  vertical,

  /// Screenshot on the left, text on the right: the project list.
  horizontal,
}

/// Project card: phone screenshot in a well, name with the platform tag, the
/// intro, technology tags and, in the horizontal layout, the spheres and the
/// stores it shipped to. Opens the project page.
class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project, this.frameHeight = 300, this.maxTags = 3})
    : layout = ProjectCardLayout.vertical;

  const ProjectCard.horizontal({super.key, required this.project, this.frameHeight = 300, this.maxTags = 4})
    : layout = ProjectCardLayout.horizontal;

  final ProjectModel project;
  final ProjectCardLayout layout;
  final double frameHeight;
  final int maxTags;

  static void open(BuildContext context, ProjectModel project) {
    GoRouter.of(context).goNamed(AppRoutInfo.project.name, pathParameters: {AppRoutInfo.projectId: project.id});
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final name = project.name;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final horizontal = layout == ProjectCardLayout.horizontal;

    return Semantics(
      button: true,
      label: name,
      child: Material(
        color: palette.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(horizontal ? 28 : AppTheme.radiusCard),
          side: BorderSide(color: palette.line),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => open(context, project),
          child: Padding(
            padding: horizontal ? EdgeInsets.all(isMobile ? 14 : 24) : const EdgeInsets.fromLTRB(20, 20, 20, 24),
            child: horizontal ? _horizontal(context, isMobile) : _vertical(context),
          ),
        ),
      ),
    );
  }

  Widget _vertical(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PhoneFrame(image: project.preview, height: frameHeight, semanticLabel: project.name),
        const SizedBox(height: 18),
        _title(context),
        ..._intro(context, lines: 3),
        ..._tags(context),
      ],
    );
  }

  Widget _horizontal(BuildContext context, bool isMobile) {
    final frameWidth = isMobile ? 104.0 : 200.0;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: frameWidth,
          child: PhoneFrame(
            image: project.preview,
            height: isMobile ? 150 : frameHeight,
            phoneWidth: frameWidth,
            topInset: isMobile ? 12 : 22,
            bezel: isMobile ? 4 : 5,
            radius: isMobile ? 12 : 18,
            wellRadius: isMobile ? 14 : 20,
            semanticLabel: project.name,
          ),
        ),
        SizedBox(width: isMobile ? 14 : 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(context, wrapTag: true),
              ..._intro(
                context,
                lines: isMobile ? 3 : 4,
                style: isMobile ? null : Theme.of(context).textTheme.bodyMedium,
              ),
              if (project.spheres.isNotEmpty && !isMobile) ...[
                const SizedBox(height: 8),
                Text(project.spheres.join(' · '), style: Theme.of(context).textTheme.bodySmall),
              ],
              if (!isMobile) ..._tags(context),
              ..._stores(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _title(BuildContext context, {bool wrapTag = false}) {
    final textTheme = Theme.of(context).textTheme;
    final platform = project.platform;
    final name = Text(project.name, style: textTheme.headlineSmall, maxLines: 2, overflow: TextOverflow.ellipsis);
    if (platform == null) return name;
    if (wrapTag) {
      return Wrap(
        spacing: 10,
        runSpacing: 6,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [name, PlatformTag(platform)],
      );
    }
    return Row(
      children: [
        Expanded(child: name),
        const SizedBox(width: 12),
        PlatformTag(platform),
      ],
    );
  }

  List<Widget> _intro(BuildContext context, {required int lines, TextStyle? style}) {
    final text = project.summary;
    if (text.isEmpty) return const [];
    return [
      const SizedBox(height: 10),
      Text(
        text,
        style: style ?? Theme.of(context).textTheme.bodySmall,
        maxLines: lines,
        overflow: TextOverflow.ellipsis,
      ),
    ];
  }

  List<Widget> _tags(BuildContext context) {
    final tags = project.stack.take(maxTags).toList();
    if (tags.isEmpty) return const [];
    return [
      const SizedBox(height: 14),
      Wrap(
        spacing: 6,
        runSpacing: 6,
        children: [for (final tag in tags) TagChip(tag, style: TagChipStyle.outlined, small: true)],
      ),
    ];
  }

  List<Widget> _stores(BuildContext context) {
    final l10n = context.l10n;
    final stores = <String>[
      if (project.links.googlePlay != null) l10n.storeGooglePlay,
      if (project.links.appStore != null) l10n.storeAppStore,
      if (project.links.github != null) l10n.storeGithub,
    ];
    if (stores.isEmpty) return const [];
    return [
      const SizedBox(height: 14),
      Text(stores.join(' · '), style: Theme.of(context).textTheme.labelMedium?.copyWith(color: context.palette.accent)),
    ];
  }
}
