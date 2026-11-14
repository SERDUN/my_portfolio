import 'package:domain/domain.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:presentation/presentation.dart';

import '../../app/site_content.dart';
import '../../app/site_paths.dart';
import '../../components/icons.dart';
import '../../components/layout.dart';
import '../../components/pill_button.dart';

/// Which top-level destination the header highlights. Flutter's
/// `ShellDestination`.
enum ShellDestination { home, projects, contacts, useful }

/// The site header: wordmark, primary navigation, language and theme switches
/// and the CV link. Flutter's `SiteHeader`. Up to the tablet range it
/// collapses to the wordmark and three round buttons, the navigation moving
/// into the menu sheet ([mobileMenu]).
///
/// [route] is the current page as `AppRoutes` spells it, so the
/// language switch links to the same page in the other language.
Component siteHeader(SiteContent content, {required ShellDestination current, required String route}) {
  final strings = content.strings;
  final language = content.language;
  final user = content.shell.user;
  final name = user == null ? 'Dmytro Serdun' : '${user.firstName} ${user.secondName}';
  final cv = user?.cv;

  Component navLink(ShellDestination destination, String label, String href) {
    final selected = destination == current;
    return a(
      href: href,
      classes: selected ? 'nav-link nav-link--selected t-title-small' : 'nav-link t-title-small',
      attributes: {if (selected) 'aria-current': 'page'},
      [.text(label)],
    );
  }

  return header(classes: 'site-header', [
    contentWidth(classes: 'site-header__row', [
      a(
        href: SitePaths.home(language),
        classes: 'site-header__wordmark t-title-large',
        attributes: {'aria-label': strings.shell_semanticsLabel_wordmark(name)},
        [.text(name)],
      ),
      nav(
        classes: 'site-header__nav',
        attributes: {'aria-label': strings.shell_navHome},
        [
          navLink(ShellDestination.home, strings.shell_navHome, SitePaths.home(language)),
          navLink(ShellDestination.projects, strings.shell_navProjects, SitePaths.projects(language)),
          navLink(ShellDestination.contacts, strings.shell_navContacts, SitePaths.contacts(language)),
        ],
      ),
      div(classes: 'site-header__actions', [
        languageToggle(content, route: route),
        languageToggleCompact(content, route: route),
        themeButton(strings.shell_switchTheme),
        pillButton(
          label: strings.common_downloadCv,
          href: cv?.toString(),
          variant: PillVariant.ink,
          compact: true,
          external: true,
          classes: 'site-header__cv',
        ),
        button(
          classes: 'round-button site-header__menu',
          attributes: {
            'popovertarget': 'mobile-menu',
            'aria-label': strings.shell_openMenu,
            'title': strings.shell_openMenu,
          },
          [appIcon(AppIcon.menu, size: 20)],
        ),
      ]),
    ]),
  ]);
}

/// EN | UK as two pills, each a link to this page in that language. Flutter's
/// `LanguageToggle`.
Component languageToggle(SiteContent content, {required String route}) => div(
  classes: 'language-toggle',
  attributes: {'role': 'group', 'aria-label': content.strings.shell_switchLanguage},
  [
    for (final language in Language.values)
      a(
        href: SitePaths.of(language, route),
        classes: language == content.language
            ? 'language-toggle__pill language-toggle__pill--selected t-label-small'
            : 'language-toggle__pill t-label-small',
        attributes: {
          'hreflang': language.code,
          'lang': language.code,
          'aria-label': content.strings.common_semanticsLabel_languageOption(
            language.code.toUpperCase(),
            language.nativeName,
          ),
          if (language == content.language) 'aria-current': 'true',
        },
        [.text(language.code.toUpperCase())],
      ),
  ],
);

/// One round button with the current code, linking to the next language.
/// Flutter's `LanguageToggle.compact`, for narrow headers.
Component languageToggleCompact(SiteContent content, {required String route}) {
  final languages = Language.values;
  final next = languages[(languages.indexOf(content.language) + 1) % languages.length];
  final code = content.language.code.toUpperCase();
  return a(
    href: SitePaths.of(next, route),
    classes: 'round-button language-toggle-compact t-label-small',
    attributes: {
      'hreflang': next.code,
      'aria-label': content.strings.common_semanticsLabel_languageCompact(code, next.nativeName),
    },
    [.text(code)],
  );
}

/// The theme switch: cycles system, light, dark (web/theme.js). All three
/// icons are in the markup and CSS shows the one for the current choice, so
/// the right icon is there before any script runs. Flutter's
/// `ThemeModeSwitcher`.
Component themeButton(String label) => button(
  classes: 'round-button theme-button',
  attributes: {'type': 'button', 'data-theme-toggle': '', 'aria-label': label, 'title': label},
  [
    appIcon(AppIcon.autoAwesome, size: 20, classes: 'theme-button__icon theme-button__icon--system'),
    appIcon(AppIcon.sunny, size: 20, classes: 'theme-button__icon theme-button__icon--light'),
    appIcon(AppIcon.nightlight, size: 20, classes: 'theme-button__icon theme-button__icon--dark'),
  ],
);

/// The navigation sheet of narrow screens: the four destinations and the CV
/// link. Flutter's mobile menu bottom sheet, as an HTML popover, so it opens
/// and closes without any script.
Component mobileMenu(SiteContent content, {required ShellDestination current}) {
  final strings = content.strings;
  final language = content.language;
  final entries = <(ShellDestination, String, String)>[
    (ShellDestination.home, strings.shell_navHome, SitePaths.home(language)),
    (ShellDestination.projects, strings.shell_navProjects, SitePaths.projects(language)),
    (ShellDestination.contacts, strings.shell_navContacts, SitePaths.contacts(language)),
    (ShellDestination.useful, strings.shell_navUseful, SitePaths.useful(language)),
  ];
  return div(
    id: 'mobile-menu',
    classes: 'mobile-menu',
    attributes: {'popover': ''},
    [
      div(classes: 'mobile-menu__handle', attributes: {'aria-hidden': 'true'}, []),
      nav([
        for (final (destination, label, href) in entries)
          a(
            href: href,
            classes: destination == current
                ? 'mobile-menu__item mobile-menu__item--selected t-title-large'
                : 'mobile-menu__item t-title-large',
            attributes: {if (destination == current) 'aria-current': 'page'},
            [
              span([.text(label)]),
              if (destination == current) appIcon(AppIcon.check),
            ],
          ),
      ]),
      pillButton(
        label: strings.common_downloadCv,
        href: content.shell.user?.cv?.toString(),
        icon: AppIcon.arrowDownward,
        external: true,
        classes: 'mobile-menu__cv',
      ),
    ],
  );
}
