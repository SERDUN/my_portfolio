import 'package:material_ui/material_ui.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/app/navigation.dart';
import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

import '../bloc/project_cubit.dart';
import '../widgets/widgets.dart';

/// One project: hero with the store buttons and the lead screenshot, the
/// description and stack, the screenshot gallery, and the next project.
class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        final project = state.project;
        final isMobile = ResponsiveBreakpoints.of(context).isMobile;
        return PageScaffold(
          child: LoadStatusView(
            status: state.status,
            hasData: project != null,
            onRetry: state.isNotFound ? null : context.read<ProjectCubit>().load,
            failureMessage: state.isNotFound ? context.l10n.project_notFound : null,
            failureAction: state.isNotFound
                ? PillButton(
                    label: context.l10n.common_allProjects,
                    icon: Icons.arrow_back_rounded,
                    iconLeading: true,
                    variant: PillButtonVariant.outline,
                    onPressed: context.openProjects,
                  )
                : null,
            builder: (context) => _ProjectBody(project: project!, next: state.nextProject, isMobile: isMobile),
          ),
        );
      },
    );
  }
}

class _ProjectBody extends StatelessWidget {
  const _ProjectBody({required this.project, required this.next, required this.isMobile});

  final ProjectModel project;
  final ProjectModel? next;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return ContentWidth(
      padding: EdgeInsets.only(top: isMobile ? 16 : 32, bottom: 96),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: PillButton(
              label: context.l10n.common_allProjects,
              icon: Icons.arrow_back_rounded,
              iconLeading: true,
              variant: PillButtonVariant.ghost,
              onPressed: context.openProjects,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 32),
          ProjectHero(project: project),
          SizedBox(height: isMobile ? 48 : 72),
          ProjectAbout(project: project),
          if (project.screenshots.isNotEmpty) ...[
            SizedBox(height: isMobile ? 48 : 72),
            ProjectGallery(project: project),
          ],
          if (next != null) ...[const SizedBox(height: 40), _NextProject(project: next!)],
        ],
      ),
    );
  }
}

class _NextProject extends StatelessWidget {
  const _NextProject({required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.only(top: 28),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: palette.line)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(context.l10n.project_next, style: textTheme.bodyMedium?.copyWith(color: palette.muted)),
          ),
          Semantics(
            link: true,
            child: InkWell(
              onTap: () => context.openProject(project.id),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(project.name, style: textTheme.headlineSmall),
                    const SizedBox(width: 12),
                    Icon(Icons.arrow_forward_rounded, size: 22, color: palette.ink),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
