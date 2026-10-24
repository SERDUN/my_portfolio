import 'package:material_ui/material_ui.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/features/main/main.dart';
import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

import '../bloc/useful_cubit.dart';
import '../widget/widgets.dart';

/// The owner's cheat sheet: one card per group, every command with a copy
/// button.
class HelpScreen extends StatelessWidget {
  const HelpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return BlocBuilder<UsefulCubit, UsefulState>(
      builder: (context, state) {
        final loading = state.status == UsefulStatus.initial || state.status == UsefulStatus.loading;
        return PageScaffold(
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : ContentWidth(
                  padding: EdgeInsets.only(top: isMobile ? 32 : 72, bottom: 96),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Eyebrow(l10n.menuTitleUseful),
                      const SizedBox(height: 10),
                      Text(l10n.featureUsefulTitle, style: isMobile ? textTheme.headlineLarge : textTheme.displayMedium),
                      const SizedBox(height: 14),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 640),
                        child: Text(
                          l10n.featureUsefulDescription,
                          style: textTheme.bodyMedium?.copyWith(color: context.palette.muted),
                        ),
                      ),
                      const SizedBox(height: 32),
                      for (final group in state.usefulCommands) ...[
                        _GroupCard(group: group),
                        const SizedBox(height: 20),
                      ],
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class _GroupCard extends StatelessWidget {
  const _GroupCard({required this.group});

  final UsefulCommandsModel group;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final textTheme = Theme.of(context).textTheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Container(
      padding: EdgeInsets.all(isMobile ? 18 : 28),
      decoration: BoxDecoration(
        color: palette.card,
        border: Border.all(color: palette.line),
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(child: Text(group.title, style: textTheme.headlineSmall)),
              const SizedBox(width: 12),
              Text('${group.commands.length}', style: textTheme.labelSmall),
            ],
          ),
          const SizedBox(height: 16),
          for (var i = 0; i < group.commands.length; i++) ...[
            if (i > 0) Divider(color: palette.line, height: 24),
            CommandTile(title: group.commands[i].title, command: group.commands[i].command),
          ],
        ],
      ),
    );
  }
}
