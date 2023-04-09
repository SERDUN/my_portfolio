import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/bars/common_app_bar.dart';
import '../host/host_routes.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        defaultPage: HomeRoutes.projects,
        onHome: () => {},
        onPortfolio: () => {},
        onContact: () => {},
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
              tr("unknown_page_title"),
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              tr("unknown_page_description").toUpperCase(),
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
