import 'package:material_ui/material_ui.dart';

import 'package:go_router/go_router.dart';

import 'package:my_portfolio/app/app_route_consts.dart';
import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

import '../button/pill_button.dart';
import '../layout/content_width.dart';

/// Router fallback for unknown paths.
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ContentWidth(
        padding: const EdgeInsets.symmetric(vertical: 96),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.unknownPageTitle, style: textTheme.displayLarge),
            const SizedBox(height: 16),
            Text(l10n.unknownPageDescription, style: textTheme.bodyLarge?.copyWith(color: context.palette.muted)),
            const SizedBox(height: 32),
            PillButton(
              label: l10n.notFoundHome,
              icon: Icons.arrow_back_rounded,
              iconLeading: true,
              onPressed: () => context.go(AppRoutInfo.resume.path),
            ),
          ],
        ),
      ),
    );
  }
}
