import 'package:material_ui/material_ui.dart';

import 'package:octo_image/octo_image.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

/// Every screenshot in a dark bezel, four across on desktop, two on phones.
class ProjectGallery extends StatelessWidget {
  const ProjectGallery({super.key, required this.project});

  final ProjectModel project;

  static const String _blurHash = 'LEHV6nWB2yk8pyo0adR*.7kCMdnj';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final palette = context.palette;
    final textTheme = Theme.of(context).textTheme;
    final shots = project.screenshots;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Expanded(child: Text(l10n.projectScreenshots, style: textTheme.headlineLarge)),
            const SizedBox(width: 16),
            Text(l10n.projectScreensCount(shots.length), style: textTheme.bodySmall),
          ],
        ),
        const SizedBox(height: 24),
        ResponsiveGrid(
          desktop: 4,
          tablet: 3,
          mobile: 2,
          gap: 20,
          children: [
            for (var i = 0; i < shots.length; i++)
              _Shot(url: shots[i], label: '${project.name} ${i + 1}', palette: palette),
          ],
        ),
      ],
    );
  }
}

class _Shot extends StatelessWidget {
  const _Shot({required this.url, required this.label, required this.palette});

  final Uri url;
  final String label;
  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: palette.card,
        border: Border.all(color: palette.line),
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
      ),
      child: Container(
        decoration: BoxDecoration(color: palette.ink, borderRadius: BorderRadius.circular(18)),
        padding: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: AspectRatio(
            aspectRatio: 9 / 19,
            child: Semantics(
              image: true,
              label: label,
              child: OctoImage(
                image: Image.network(url.toString()).image,
                placeholderBuilder: blurHashPlaceholderBuilder(ProjectGallery._blurHash),
                errorBuilder: OctoError.icon(color: palette.muted),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
