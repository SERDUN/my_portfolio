import 'package:material_ui/material_ui.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/features/main/main.dart';
import 'package:my_portfolio/localization/localization.dart';

import '../bloc/useful_cubit.dart';
import '../widget/widgets.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textThemes = Theme.of(context).textTheme;

    return BlocBuilder<UsefulCubit, UsefulState>(
      builder: (context, state) {
        final loading = state.status == UsefulStatus.initial || state.status == UsefulStatus.loading;
        return PageScaffold(
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      context.l10n.featureUsefulTitle,
                      style: textThemes.displaySmall,
                    ),
                    const DecorationViewLines(),
                    const SizedBox(height: 40),
                    Text(
                      context.l10n.featureUsefulDescription,
                      style: textThemes.labelSmall?.copyWith(color: colorScheme.onSurfaceVariant),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: state.usefulCommands
                          .map(
                            (e) => ExpansionTile(
                              title: Text(e.title, style: textThemes.titleLarge),
                              childrenPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                              tilePadding: const EdgeInsets.only(left: 16, right: 8),
                              children: e.commands
                                  .map((command) => CommandTile(title: command.title, subtitle: command.command))
                                  .toList(),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
        );
      },
    );
  }
}
