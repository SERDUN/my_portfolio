import 'package:material_ui/material_ui.dart';

import 'package:responsive_framework/responsive_framework.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/localization/localization.dart';

/// Description on the left, the dependency stack as chips on the right.
class ProjectAbout extends StatelessWidget {
  const ProjectAbout({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    final about = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.projectAbout, style: textTheme.headlineLarge),
        const SizedBox(height: 16),
        SelectableText(project.description, style: textTheme.bodyLarge),
      ],
    );

    final stack = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.projectDependencyStack, style: textTheme.headlineLarge),
        const SizedBox(height: 16),
        Wrap(spacing: 8, runSpacing: 8, children: [for (final tech in project.technologies) TagChip(tech)]),
      ],
    );

    if (!isDesktop) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [about, const SizedBox(height: 40), stack],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 7, child: about),
        const SizedBox(width: 40),
        Expanded(flex: 5, child: stack),
      ],
    );
  }
}
