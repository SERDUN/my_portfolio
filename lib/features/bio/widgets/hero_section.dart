import 'package:material_ui/material_ui.dart';

import 'package:responsive_framework/responsive_framework.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

/// Hero: eyebrow with position and location, the headline with its accent
/// tail, the intro, the two calls to action, and the portrait with three
/// stat tiles. Two columns on desktop, stacked below.
class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.user,
    required this.projectCount,
    required this.platformCount,
    required this.onSeeProjects,
  });

  final PortfolioUserModel user;
  final int projectCount;
  final int platformCount;
  final VoidCallback onSeeProjects;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    final copy = _HeroCopy(user: user, onSeeProjects: onSeeProjects);
    final portrait = _Portrait(user: user, projectCount: projectCount, platformCount: platformCount);

    return ContentWidth(
      padding: EdgeInsets.only(top: isMobile ? 40 : 88, bottom: isMobile ? 32 : 72),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 7, child: copy),
                const SizedBox(width: 40),
                Expanded(flex: 5, child: portrait),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [copy, const SizedBox(height: 32), portrait],
            ),
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({required this.user, required this.onSeeProjects});

  final PortfolioUserModel user;
  final VoidCallback onSeeProjects;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final textTheme = Theme.of(context).textTheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final l10n = context.l10n;

    final eyebrow = [user.position, user.location].where((s) => s.isNotEmpty).join(' · ');
    final headlineStyle = isMobile ? textTheme.displaySmall : textTheme.displayLarge;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (eyebrow.isNotEmpty) ...[Eyebrow(eyebrow), const SizedBox(height: 28)],
        if (user.headline.isNotEmpty)
          Text.rich(_headlineSpan(user, headlineStyle, palette), style: headlineStyle)
        else
          Text(user.name, style: headlineStyle),
        const SizedBox(height: 28),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: SelectableText(user.intro, style: textTheme.bodyLarge),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 14,
          runSpacing: 12,
          children: [
            PillButton(
              label: l10n.buttonDownloadCv,
              icon: Icons.arrow_downward_rounded,
              onPressed: user.cv == null ? null : () => openUri(user.cv),
            ),
            PillButton(
              label: l10n.buttonSeeProjects,
              icon: Icons.arrow_forward_rounded,
              variant: PillButtonVariant.outline,
              onPressed: onSeeProjects,
            ),
          ],
        ),
      ],
    );
  }

  /// Splits the headline so its accent tail is set italic in the accent color.
  static TextSpan _headlineSpan(PortfolioUserModel user, TextStyle? style, AppPalette palette) {
    final headline = user.headline;
    final accent = user.headlineAccent;
    final index = accent.isEmpty ? -1 : headline.lastIndexOf(accent);
    if (index < 0) return TextSpan(text: headline);
    return TextSpan(
      children: [
        TextSpan(text: headline.substring(0, index)),
        TextSpan(
          text: accent,
          style: style?.copyWith(color: palette.accent, fontStyle: FontStyle.italic),
        ),
        TextSpan(text: headline.substring(index + accent.length)),
      ],
    );
  }
}

class _Portrait extends StatelessWidget {
  const _Portrait({required this.user, required this.projectCount, required this.platformCount});

  final PortfolioUserModel user;
  final int projectCount;
  final int platformCount;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = context.l10n;
    final years = user.yearsOfExperience();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 16),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                left: -16,
                top: 16,
                bottom: -16,
                right: 16,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: palette.accentSoft, borderRadius: BorderRadius.circular(28)),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Container(
                  decoration: BoxDecoration(
                    color: palette.card,
                    border: Border.all(color: palette.line),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: user.avatar == null
                        ? const SizedBox.shrink()
                        : Image.network(
                            user.avatar.toString(),
                            fit: BoxFit.cover,
                            semanticLabel: user.name,
                            errorBuilder: (_, _, _) => const SizedBox.shrink(),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _StatTile(value: years == null ? '—' : '$years+', label: l10n.statsYears),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatTile(value: '$projectCount', label: l10n.statsProjects),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatTile(value: '$platformCount', label: l10n.statsPlatforms),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
      decoration: BoxDecoration(
        color: palette.card,
        border: Border.all(color: palette.line),
        borderRadius: BorderRadius.circular(AppTheme.radiusTile),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: textTheme.headlineLarge?.copyWith(height: 1)),
          const SizedBox(height: 6),
          Text(label, style: textTheme.labelSmall),
        ],
      ),
    );
  }
}
