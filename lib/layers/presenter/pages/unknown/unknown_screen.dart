import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/widgets/bars/common_app_bar.dart';
import '../../navigation/state/navigation_cubit.dart';
import '../home/host/host_routes.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        defaultPage: HomeRoutes.projects,
        onHome: () =>
            BlocProvider.of<NavigationCubit>(context).replaceToIntro(),
        onPortfolio: () =>
            BlocProvider.of<NavigationCubit>(context).replaceToProjects(),
        onContact: () =>
            BlocProvider.of<NavigationCubit>(context).replaceToContact(),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              '404',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Fuck russia!'.toUpperCase(),
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
