import 'package:material_ui/material_ui.dart';

import 'package:go_router/go_router.dart';

import 'package:my_portfolio/app/app_route_consts.dart';
import 'package:my_portfolio/localization/localization.dart';

import '../button/pill_button.dart';
import 'status_message.dart';

/// Router fallback for unknown paths.
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: StatusMessage(
        icon: Icons.explore_off_rounded,
        title: l10n.unknownPageTitle,
        message: l10n.unknownPageDescription,
        action: PillButton(
          label: l10n.notFoundHome,
          icon: Icons.arrow_back_rounded,
          iconLeading: true,
          onPressed: () => context.go(AppRoutInfo.resume.path),
        ),
      ),
    );
  }
}
