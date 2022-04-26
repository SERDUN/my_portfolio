import 'package:flutter/material.dart';

import '../../pages/home/host/host_page.dart';
import '../../pages/home/host/host_routes.dart';
import 'base_page.dart';

class ContactPage extends BasePage {
  const ContactPage(Map<String, dynamic> args)
      : super(key: const ValueKey('ContactPage'), name: "/contact", args: args);

  @override
  Widget root() => const HostPage(
        defaultPage: HomeRoutes.contact,
      );
}
