import 'package:material_ui/material_ui.dart';

import 'package:responsive_framework/responsive_framework.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

/// Career timeline: one row per place of work, the period on the left and
/// the role, terms, summary and highlights on the right. Stacked on mobile.
class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key, required this.experience});

  final List<ExperienceModel> experience;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (experience.isEmpty) return const SizedBox.shrink();
    return ContentWidth(
      padding: const EdgeInsets.only(top: 16, bottom: 72),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader(
            eyebrow: l10n.home_experienceEyebrow,
            title: l10n.home_experienceTitle,
            description: l10n.home_experienceDescription,
          ),
          const SizedBox(height: 32),
          for (final (index, item) in experience.indexed) ...[
            if (index > 0) const SizedBox(height: 16),
            _ExperienceRow(item: item),
          ],
        ],
      ),
    );
  }
}

class _ExperienceRow extends StatelessWidget {
  const _ExperienceRow({required this.item});

  final ExperienceModel item;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final textTheme = Theme.of(context).textTheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    final period = Text(item.period, style: textTheme.labelMedium?.copyWith(color: palette.accent));
    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.company, style: textTheme.headlineSmall),
        const SizedBox(height: 4),
        Text(
          [item.role, item.terms].where((s) => s.isNotEmpty).join(' · '),
          style: textTheme.bodyMedium?.copyWith(color: palette.muted),
        ),
        if (item.summary.isNotEmpty) ...[
          const SizedBox(height: 14),
          SelectableText(item.summary, style: textTheme.bodyMedium),
        ],
        if (item.highlights.isNotEmpty) ...[
          const SizedBox(height: 12),
          for (final line in item.highlights) _Highlight(line),
        ],
      ],
    );

    return Container(
      padding: EdgeInsets.all(isMobile ? 22 : 28),
      decoration: BoxDecoration(
        color: palette.card,
        border: Border.all(color: palette.line),
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
      ),
      child: isMobile
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [period, const SizedBox(height: 10), body])
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Padding(padding: const EdgeInsets.only(top: 6), child: period),
                ),
                const SizedBox(width: 24),
                Expanded(child: body),
              ],
            ),
    );
  }
}

class _Highlight extends StatelessWidget {
  const _Highlight(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final style = Theme.of(context).textTheme.bodyMedium;
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExcludeSemantics(
            child: Text('—', style: style?.copyWith(color: palette.accent)),
          ),
          const SizedBox(width: 10),
          Expanded(child: SelectableText(text, style: style)),
        ],
      ),
    );
  }
}
