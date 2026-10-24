import 'package:material_ui/material_ui.dart';

import 'package:my_portfolio/app/keys.dart';
import 'package:my_portfolio/app/navigation.dart';
import 'package:my_portfolio/localization/localization.dart';

import '../button/pill_button.dart';
import '../semantics/semantic_action.dart';
import 'status_message.dart';

/// Router fallback for unknown paths.
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SemanticId(
        identifier: notFoundScreenId,
        child: StatusMessage(
          icon: Icons.explore_off_rounded,
          title: l10n.notFound_title,
          message: l10n.notFound_description,
          action: PillButton(
            label: l10n.notFound_home,
            icon: Icons.arrow_back_rounded,
            iconLeading: true,
            identifier: notFoundHomeId,
            onPressed: context.openHome,
          ),
        ),
      ),
    );
  }
}
