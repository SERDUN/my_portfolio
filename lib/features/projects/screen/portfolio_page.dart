import 'package:material_ui/material_ui.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/app/app_route_consts.dart';
import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/features/main/main.dart';
import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

import '../bloc/projects_cubit.dart';
import '../widgets/project_card.dart';

/// All projects: a statement header, a platform filter and the cards.
class PortfolioPage extends StatefulWidget {
  const PortfolioPage({
    super.key,
  });

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  /// null = all platforms.
  String? _platform;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      builder: (context, state) {
        final projects = state.projects;
        final platforms = _platformCounts(projects);
        final visible = _platform == null ? projects : projects.where((p) => p.platform == _platform).toList();
        final isMobile = ResponsiveBreakpoints.of(context).isMobile;

        return PageScaffold(
          child: projects.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ContentWidth(
                  padding: EdgeInsets.only(top: isMobile ? 32 : 72, bottom: 96),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _Header(
                        count: projects.length,
                        platformCount: platforms.length,
                        selected: _platform,
                        platforms: platforms,
                        onSelect: (platform) => setState(() => _platform = platform),
                      ),
                      const SizedBox(height: 32),
                      ResponsiveGrid(
                        desktop: 2,
                        tablet: 1,
                        mobile: 1,
                        gap: 24,
                        children: [for (final project in visible) ProjectCard.horizontal(project: project)],
                      ),
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: PillButton(
                          label: context.l10n.projectsCta,
                          icon: Icons.arrow_forward_rounded,
                          variant: PillButtonVariant.ghost,
                          onPressed: () => context.go(AppRoutInfo.contacts.path),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  /// Platform → number of projects, in order of first appearance.
  static Map<String, int> _platformCounts(List<ProjectModel> projects) {
    final counts = <String, int>{};
    for (final project in projects) {
      final platform = project.platform;
      if (platform != null) counts[platform] = (counts[platform] ?? 0) + 1;
    }
    return counts;
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.count,
    required this.platformCount,
    required this.platforms,
    required this.selected,
    required this.onSelect,
  });

  final int count;
  final int platformCount;
  final Map<String, int> platforms;
  final String? selected;
  final ValueChanged<String?> onSelect;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Eyebrow(l10n.lastProjectTitle),
        const SizedBox(height: 10),
        Text(
          l10n.projectsTitle(count, platformCount),
          style: isMobile ? textTheme.headlineLarge : textTheme.displayMedium,
        ),
        const SizedBox(height: 14),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Text(l10n.projectsDescription, style: textTheme.bodyMedium?.copyWith(color: context.palette.muted)),
        ),
      ],
    );

    final filter = Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _FilterChip(label: '${l10n.filterAll} · $count', selected: selected == null, onTap: () => onSelect(null)),
        for (final entry in platforms.entries)
          _FilterChip(
            label: '${entry.key} · ${entry.value}',
            selected: selected == entry.key,
            onTap: () => onSelect(entry.key),
          ),
      ],
    );

    if (!isDesktop) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [copy, const SizedBox(height: 24), filter],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(child: copy),
        const SizedBox(width: 40),
        filter,
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Semantics(
      button: true,
      selected: selected,
      child: Material(
        color: selected ? palette.ink : Colors.transparent,
        shape: StadiumBorder(side: BorderSide(color: selected ? palette.ink : Theme.of(context).colorScheme.outline)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: selected ? null : onTap,
          child: Container(
            constraints: const BoxConstraints(minHeight: 44),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              widthFactor: 1,
              child: Text(
                label,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(color: selected ? palette.ground : palette.ink),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
