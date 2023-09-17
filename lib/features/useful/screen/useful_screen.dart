import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_portfolio/core/core.dart';

import '../bloc/useful_cubit.dart';
import '../widget/widgets.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({
    super.key,
  });

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textThemes = Theme.of(context).textTheme;

    return BlocBuilder<UsefulCubit, UsefulState>(
      builder: (context, state) {
        return state.status == UsefulStatus.initial || state.status == UsefulStatus.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Useful commands",
                      style: textThemes.displaySmall,
                    ),
                    const DecorationViewLines(),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "This tab does not have any informative meaning for third-party users, it is only the commands I often use that I usually forget.",
                      style: textThemes.labelSmall?.copyWith(color: colorScheme.onBackground.withOpacity(0.2)),
                    ),
                    SingleChildScrollView(
                      child: Column(
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
                              .toList()),
                    )
                  ],
                ),
              );
      },
    );
  }
}
