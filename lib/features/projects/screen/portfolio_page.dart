import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_portfolio/core/core.dart';

import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../bloc/state.dart';

import 'package:my_portfolio/core/widgets/widgets.dart';

import '../widgets/portfolio_item.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<PortfolioPage> {
  late final ProjectsBloc _bloc = BlocProvider.of<ProjectsBloc>(context);

  @override
  void didChangeDependencies() {
    String? locale = EasyLocalization.of(context)?.locale.languageCode;
    pLogger.i("PortfolioPage-> didChangeDependencies $locale");
    _bloc.add(InitProjectsEvent(locale));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsBloc, ProjectsState>(
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
                    tr("last_project_title"),
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
                        itemBuilder: (context, i) {
                          return PortfolioItem(project: state.projects[i]);
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
