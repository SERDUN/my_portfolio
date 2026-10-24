import 'package:material_ui/material_ui.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/features/projects/widgets/project_card.dart';
import 'package:my_portfolio/localization/localization.dart';

/// Three featured projects as cards, with a link to the full list.
class SelectedWorkSection extends StatelessWidget {
  const SelectedWorkSection({super.key, required this.projects, required this.totalCount, required this.onSeeAll});

  final List<ProjectModel> projects;
  final int totalCount;
  final VoidCallback onSeeAll;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (projects.isEmpty) return const SizedBox.shrink();
    return ContentWidth(
      padding: const EdgeInsets.only(top: 0, bottom: 96),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader(
            eyebrow: l10n.selectedWorkEyebrow,
            title: l10n.selectedWorkTitle,
            trailing: PillButton(
              label: l10n.allProjects(totalCount),
              icon: Icons.arrow_forward_rounded,
              variant: PillButtonVariant.ghost,
              onPressed: onSeeAll,
            ),
          ),
          const SizedBox(height: 32),
          ResponsiveGrid(children: [for (final project in projects.take(3)) ProjectCard(project: project)]),
        ],
      ),
    );
  }
}
