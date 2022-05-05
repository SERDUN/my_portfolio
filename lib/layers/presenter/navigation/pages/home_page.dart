import 'package:flutter/material.dart';

import '../../pages/host/host_page.dart';
import '../../pages/host/host_routes.dart';
import '../common/pages/base_page.dart';

class HomePage extends BasePage {
  const HomePage(Map<String, dynamic> args)
      : super(key: const ValueKey('HomePage'), name: "/", args: args);

  @override
  Widget root() => const HostPage(
        defaultPage: HomeRoutes.intro,
      );
}
