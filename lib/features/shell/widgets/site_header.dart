import 'package:material_ui/material_ui.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/app/keys.dart';
import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

import '../bloc/shell_cubit.dart';
import 'mobile_menu.dart';
import 'nav_link.dart';

/// Which top-level destination the header highlights.
enum ShellDestination { home, projects, contacts, useful }

/// Site header: wordmark, primary navigation, language and theme switches and
/// the CV call to action. Collapses to wordmark + three round buttons on
/// phones and tablets, where the navigation lives in a bottom sheet.
class SiteHeader extends StatelessWidget implements PreferredSizeWidget {
  const SiteHeader({
    super.key,
    required this.current,
    required this.onNavigate,
    required this.themeMode,
    required this.onThemeChange,
    required this.language,
    required this.onLanguageChange,
  });

  final ShellDestination current;
  final ValueChanged<ShellDestination> onNavigate;
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeChange;
  final Language language;
  final ValueChanged<Language> onLanguageChange;

  static const double desktopHeight = 76;
  static const double mobileHeight = 64;

  @override
  Size get preferredSize => const Size.fromHeight(desktopHeight);

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final isWide = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    final height = isWide ? desktopHeight : mobileHeight;

    return Material(
      color: palette.ground,
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: palette.line)),
        ),
        child: SafeArea(
          bottom: false,
          child: SizedBox(
            height: height,
            child: ContentWidth(
              child: Row(
                children: [
                  if (isWide)
                    _Wordmark(onTap: () => onNavigate(ShellDestination.home))
                  else
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: _Wordmark(onTap: () => onNavigate(ShellDestination.home)),
                      ),
                    ),
                  if (isWide) ...[
                    const Spacer(),
                    _navigation(context),
                    const Spacer(),
                    _switches(context),
                    const SizedBox(width: 12),
                    _cvButton(context),
                  ] else ...[
                    LanguageToggle.compact(
                      current: language,
                      onChanged: onLanguageChange,
                      compactIdentifier: shellLanguageCompactId,
                    ),
                    const SizedBox(width: 8),
                    ThemeModeSwitcher(
                      themeMode: themeMode,
                      onThemeChange: onThemeChange,
                      tooltip: context.l10n.shell_switchTheme,
                      identifier: shellThemeButtonId,
                    ),
                    const SizedBox(width: 8),
                    SemanticAction(
                      identifier: shellMenuButtonId,
                      child: IconButton(
                        tooltip: context.l10n.shell_openMenu,
                        onPressed: () => showMobileMenu(context, current: current, onNavigate: onNavigate),
                        icon: const Icon(Icons.menu_rounded, size: 20),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _navigation(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        NavLink(
          identifier: shellNavHomeId,
          label: l10n.shell_navHome,
          selected: current == ShellDestination.home,
          onTap: () => onNavigate(ShellDestination.home),
        ),
        const SizedBox(width: 28),
        NavLink(
          identifier: shellNavProjectsId,
          label: l10n.shell_navProjects,
          selected: current == ShellDestination.projects,
          onTap: () => onNavigate(ShellDestination.projects),
        ),
        const SizedBox(width: 28),
        NavLink(
          identifier: shellNavContactsId,
          label: l10n.shell_navContacts,
          selected: current == ShellDestination.contacts,
          onTap: () => onNavigate(ShellDestination.contacts),
        ),
      ],
    );
  }

  Widget _switches(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        LanguageToggle(
          current: language,
          onChanged: onLanguageChange,
          optionIdentifier: (language) => shellLanguageOptionId(language.code),
          groupLabel: context.l10n.shell_switchLanguage,
        ),
        const SizedBox(width: 12),
        ThemeModeSwitcher(
          themeMode: themeMode,
          onThemeChange: onThemeChange,
          tooltip: context.l10n.shell_switchTheme,
          identifier: shellThemeButtonId,
        ),
      ],
    );
  }

  Widget _cvButton(BuildContext context) {
    return BlocBuilder<ShellCubit, ShellState>(
      buildWhen: (a, b) => a.user?.cv != b.user?.cv,
      builder: (context, state) {
        final cv = state.user?.cv;
        return PillButton(
          label: context.l10n.common_downloadCv,
          variant: PillButtonVariant.ink,
          compact: true,
          identifier: shellCvButtonId,
          onPressed: cv == null ? null : () => openUri(cv),
        );
      },
    );
  }
}

class _Wordmark extends StatelessWidget {
  const _Wordmark({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShellCubit, ShellState>(
      buildWhen: (a, b) => a.user != b.user,
      builder: (context, state) {
        final user = state.user;
        final name = user == null ? 'Dmytro Serdun' : '${user.firstName} ${user.secondName}';
        return SemanticAction.link(
          label: context.l10n.shell_semanticsLabel_wordmark(name),
          identifier: shellWordmarkId,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            child: ExcludeSemantics(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
