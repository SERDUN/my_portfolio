import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/layers/presenter/pages/portfolio/projects/bloc/state.dart';
import 'package:my_portfolio/layers/presenter/pages/portfolio/projects/portfolio_item.dart';

import '../../../common/widgets/decoration/decoration_view.dart';
import 'bloc/bloc.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<PortfolioPage> {
  late ProjectsBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<ProjectsBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsBloc, ProjectsState>(builder: (context, state) {
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
                    'Last projects'.toUpperCase(),
                    style: Theme.of(context).textTheme.headline2,
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
                          return PortfolioItem(
                            project: state.projects[i],
                          );
                        },
                      ),
              ],
            )),
      );
    });
  }
}
