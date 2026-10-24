import 'package:material_ui/material_ui.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

/// Skills as one card per group with the skills as chips.
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key, required this.skills});

  final List<PortfolioSkillsModel> skills;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ContentWidth(
      padding: const EdgeInsets.only(top: 16, bottom: 72),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader(eyebrow: l10n.introSkills, title: l10n.skillsTitle, description: l10n.skillsDescription),
          const SizedBox(height: 32),
          ResponsiveGrid(children: [for (final group in skills) _SkillGroupCard(group: group)]),
        ],
      ),
    );
  }
}

class _SkillGroupCard extends StatelessWidget {
  const _SkillGroupCard({required this.group});

  final PortfolioSkillsModel group;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: palette.card,
        border: Border.all(color: palette.line),
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(child: Text(group.title, style: textTheme.headlineSmall)),
              const SizedBox(width: 12),
              Text('${group.children.length}', style: textTheme.labelSmall),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(spacing: 8, runSpacing: 8, children: [for (final skill in group.children) TagChip(skill.title)]),
        ],
      ),
    );
  }
}
