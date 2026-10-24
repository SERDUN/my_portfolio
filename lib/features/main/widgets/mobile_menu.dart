import 'package:material_ui/material_ui.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

import '../bloc/shell_cubit.dart';
import 'site_header.dart';

/// Navigation for narrow screens: a bottom sheet with the four destinations
/// and the CV call to action.
Future<void> showMobileMenu(
  BuildContext context, {
  required ShellDestination current,
  required ValueChanged<ShellDestination> onNavigate,
}) {
  final shell = context.read<ShellCubit>();
  return showModalBottomSheet<void>(
    context: context,
    useSafeArea: true,
    builder: (sheetContext) => BlocProvider.value(
      value: shell,
      child: _MobileMenu(
        current: current,
        onNavigate: (destination) {
          Navigator.of(sheetContext).pop();
          onNavigate(destination);
        },
      ),
    ),
  );
}

class _MobileMenu extends StatelessWidget {
  const _MobileMenu({required this.current, required this.onNavigate});

  final ShellDestination current;
  final ValueChanged<ShellDestination> onNavigate;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final palette = context.palette;
    final entries = <(ShellDestination, String)>[
      (ShellDestination.home, l10n.menuTitleHome),
      (ShellDestination.projects, l10n.menuTitlePortfolio),
      (ShellDestination.contact, l10n.menuTitleContact),
      (ShellDestination.useful, l10n.menuTitleUseful),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(color: palette.line, borderRadius: BorderRadius.circular(2)),
            ),
          ),
          const SizedBox(height: 16),
          for (final (destination, label) in entries)
            ListTile(
              title: Text(
                label,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: destination == current ? palette.accent : palette.ink,
                    ),
              ),
              trailing: destination == current ? Icon(Icons.check_rounded, color: palette.accent) : null,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              onTap: () => onNavigate(destination),
            ),
          const SizedBox(height: 16),
          BlocBuilder<ShellCubit, ShellState>(
            builder: (context, state) {
              final cv = state.user?.cv;
              return PillButton(
                label: l10n.buttonDownloadCv,
                icon: Icons.arrow_downward_rounded,
                onPressed: cv == null || cv.isEmpty ? null : () => openExternalUrl(cv),
              );
            },
          ),
        ],
      ),
    );
  }
}
