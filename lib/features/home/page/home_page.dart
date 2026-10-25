import 'package:material_ui/material_ui.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_portfolio/app/keys.dart';
import 'package:my_portfolio/app/navigation.dart';
import 'package:my_portfolio/core/core.dart';

import '../bloc/home_cubit.dart';
import '../widgets/widgets.dart';

/// Home: hero with the portrait and stats, the career timeline, skills as
/// chips, selected work.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final user = state.user;
        return SemanticId(
          identifier: homeScreenId,
          child: PageScaffold(
            child: LoadStatusView(
              status: state.status,
              hasData: user != null,
              onRetry: context.read<HomeCubit>().load,
              builder: (context) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeroSection(
                    user: user!,
                    projectCount: state.projects.length,
                    platformCount: state.platformCount,
                    onSeeProjects: () => _openProjects(context),
                  ),
                  ExperienceSection(experience: user.experience),
                  SkillsSection(skills: state.skills ?? const []),
                  SelectedWorkSection(
                    projects: state.featuredProjects,
                    totalCount: state.projects.length,
                    onSeeAll: () => _openProjects(context),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _openProjects(BuildContext context) => context.openProjects();
}
