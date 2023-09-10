import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_portfolio/core/widgets/widgets.dart';
import 'package:my_portfolio/localization/localization.dart';

import '../bloc/projects_cubit.dart';
import '../widgets/portfolio_item.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    context.l10n.lastProjectTitle,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                const DecorationViewLines(),
                const SizedBox(
                  height: 40,
                ),
                state.projects.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 24,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.projects.length,
                        itemBuilder: (context, i) => PortfolioItem(project: state.projects[i]),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
