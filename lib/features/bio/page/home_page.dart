import 'package:material_ui/material_ui.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:my_portfolio/app/app_route_consts.dart';
import 'package:my_portfolio/features/bio/bloc/bio_cubit.dart';
import 'package:my_portfolio/features/main/main.dart';

import '../widgets/widgets.dart';

/// Home: hero with the portrait and stats, skills as chips, selected work.
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BioCubit, BioState>(
      builder: (context, state) {
        final user = state.user;
        return PageScaffold(
          child: AnimatedOpacity(
            opacity: user != null ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 400),
            child: user == null
                ? const SizedBox.shrink()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      HeroSection(
                        user: user,
                        projectCount: state.projects.length,
                        platformCount: state.platformCount,
                        onSeeProjects: () => _openProjects(context),
                      ),
                      SkillsSection(skills: state.skills ?? const []),
                      SelectedWorkSection(
                        projects: state.featuredProjects,
                        totalCount: state.projects.length,
                        onSeeAll: () => _openProjects(context),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }

  void _openProjects(BuildContext context) => context.go(AppRoutInfo.portfolio.path);
}
