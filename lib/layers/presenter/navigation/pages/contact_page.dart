import 'package:flutter/material.dart';

import '../../pages/host/host_page.dart';
import '../../pages/host/host_routes.dart';
import '../common/pages/base_page.dart';

class ContactPage extends BasePage {
  const ContactPage(Map<String, dynamic> args)
      : super(key: const ValueKey('ContactPage'), name: "/contact", args: args);

  @override
  Widget root() => const HostPage(
        defaultPage: HomeRoutes.contact,
      );
}
