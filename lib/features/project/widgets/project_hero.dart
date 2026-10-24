import 'package:material_ui/material_ui.dart';

import 'package:ionicons/ionicons.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

/// Project hero: platform tag and spheres, the name, the intro, the store
/// buttons, three facts, and the lead screenshot in a large phone frame.
class ProjectHero extends StatelessWidget {
  const ProjectHero({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    final copy = _Copy(project: project);
    final frame = PhoneFrame(
      imageUrl: project.preview,
      height: isMobile ? 380 : 520,
      phoneWidth: isMobile ? 220 : 280,
      bezel: isMobile ? 6 : 8,
      radius: isMobile ? 24 : 30,
      wellRadius: 28,
      topInset: isMobile ? 28 : 36,
      semanticLabel: project.name,
    );

    if (!isDesktop) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [copy, const SizedBox(height: 32), frame],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 7, child: copy),
        const SizedBox(width: 40),
        Expanded(flex: 5, child: frame),
      ],
    );
  }
}

class _Copy extends StatelessWidget {
  const _Copy({required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final palette = context.palette;
    final textTheme = Theme.of(context).textTheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final platform = project.platform;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            if (platform != null) PlatformTag(platform),
            if (project.spheres.isNotEmpty) Text(project.spheres.join(' · '), style: textTheme.bodySmall),
          ],
        ),
        const SizedBox(height: 22),
        Text(project.name ?? '', style: isMobile ? textTheme.displaySmall : textTheme.displayLarge),
        if ((project.intro ?? '').isNotEmpty) ...[
          const SizedBox(height: 22),
          Text(
            project.intro!,
            style: GoogleFonts.fraunces(
              fontSize: isMobile ? 20 : 26,
              height: 1.3,
              fontStyle: FontStyle.italic,
              color: palette.body,
            ),
          ),
        ],
        const SizedBox(height: 22),
        _StoreButtons(project: project),
        const SizedBox(height: 28),
        Container(
          padding: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(border: Border(top: BorderSide(color: palette.line))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _Fact(label: l10n.projectFactPlatforms, value: _platforms(context))),
              const SizedBox(width: 16),
              Expanded(child: _Fact(label: l10n.projectFactStack, value: '${project.technologies.length}')),
              const SizedBox(width: 16),
              Expanded(child: _Fact(label: l10n.projectFactScreens, value: '${project.screenshots.length}')),
            ],
          ),
        ),
      ],
    );
  }

  /// "iOS, Android" from the store links; the platform tag when there are none.
  String _platforms(BuildContext context) {
    final l10n = context.l10n;
    final names = <String>[
      if (project.linkIOS.isNotEmpty) l10n.platformIos,
      if (project.linkAndroid.isNotEmpty) l10n.platformAndroid,
      if (project.technologies.any((t) => t.toLowerCase() == 'web')) l10n.platformWeb,
    ];
    if (names.isNotEmpty) return names.join(', ');
    return project.platform ?? '—';
  }
}

class _StoreButtons extends StatelessWidget {
  const _StoreButtons({required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final buttons = <Widget>[
      if (project.linkIOS.isNotEmpty)
        PillButton(
          label: l10n.storeAppStore,
          icon: Ionicons.logoAppleAppstore,
          variant: PillButtonVariant.ink,
          onPressed: () => openExternalUrl(project.linkIOS),
        ),
      if (project.linkAndroid.isNotEmpty)
        PillButton(
          label: l10n.storeGooglePlay,
          icon: Ionicons.logoGooglePlaystore,
          variant: project.linkIOS.isEmpty ? PillButtonVariant.ink : PillButtonVariant.outline,
          onPressed: () => openExternalUrl(project.linkAndroid),
        ),
      if (project.linkGithub.isNotEmpty)
        PillButton(
          label: l10n.storeGithub,
          icon: Ionicons.logoGithub,
          variant: project.hasStoreLink ? PillButtonVariant.outline : PillButtonVariant.ink,
          onPressed: () => openExternalUrl(project.linkGithub),
        ),
    ];
    if (buttons.isEmpty) return const SizedBox.shrink();
    return Wrap(spacing: 12, runSpacing: 12, children: buttons);
  }
}

class _Fact extends StatelessWidget {
  const _Fact({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: textTheme.labelSmall?.copyWith(letterSpacing: 1.3, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value, style: textTheme.titleMedium),
      ],
    );
  }
}
