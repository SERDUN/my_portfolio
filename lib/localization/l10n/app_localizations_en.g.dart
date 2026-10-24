// ignore_for_file: non_constant_identifier_names

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get common_allProjects => 'All projects';

  @override
  String get common_appStore => 'App Store';

  @override
  String get common_downloadCv => 'Download CV';

  @override
  String get common_github => 'GitHub';

  @override
  String get common_googlePlay => 'Google Play';

  @override
  String get common_loadFailed => 'Could not load this page.';

  @override
  String get common_retry => 'Try again';

  @override
  String get contacts_description =>
      'Email is the fastest way. The other links lead where I post and answer.';

  @override
  String get contacts_title => 'Get in touch';

  @override
  String home_allProjects(int count) {
    return 'All $count projects';
  }

  @override
  String get home_seeProjects => 'See projects';

  @override
  String get home_selectedWorkEyebrow => 'Selected work';

  @override
  String get home_selectedWorkTitle => 'Three projects to start with';

  @override
  String get home_skillsDescription =>
      'Grouped the way I use them day to day: Flutter first, the Android roots underneath, and the things around the client.';

  @override
  String get home_skillsEyebrow => 'Skills';

  @override
  String get home_skillsTitle => 'What I work with';

  @override
  String get home_statsPlatforms => 'platforms';

  @override
  String get home_statsProjects => 'projects';

  @override
  String get home_statsYears => 'years in mobile';

  @override
  String get notFound_description => 'Fuck Russia!';

  @override
  String get notFound_home => 'Back home';

  @override
  String get notFound_title => '404';

  @override
  String get project_aboutTitle => 'About the project';

  @override
  String get project_factPlatforms => 'Platforms';

  @override
  String get project_factScreens => 'Screens';

  @override
  String get project_factStack => 'Stack';

  @override
  String get project_next => 'Next project';

  @override
  String get project_notFound => 'There is no such project.';

  @override
  String get project_platformAndroid => 'Android';

  @override
  String get project_platformIos => 'iOS';

  @override
  String get project_platformWeb => 'Web';

  @override
  String project_screensCount(int count) {
    return '$count screens';
  }

  @override
  String get project_screenshotsTitle => 'Screenshots';

  @override
  String get project_stackTitle => 'Dependency stack';

  @override
  String get projects_cta => 'Want one like these? Get in touch';

  @override
  String get projects_description =>
      'Store apps and client work from the last years. Flutter where the team wanted one codebase, native Android where it had to be.';

  @override
  String get projects_eyebrow => 'Projects';

  @override
  String get projects_filterAll => 'All';

  @override
  String projects_title(int count, int platforms) {
    return '$count apps, $platforms platforms, one habit: ship it clean.';
  }

  @override
  String get shell_footerGlory => 'Glory to Ukraine';

  @override
  String get shell_footerSource => 'Source on GitHub';

  @override
  String get shell_footerTitle => 'Let\'s talk about your next app.';

  @override
  String get shell_navContacts => 'Contact';

  @override
  String get shell_navHome => 'Home';

  @override
  String get shell_navProjects => 'Projects';

  @override
  String get shell_navUseful => 'Useful';

  @override
  String get shell_openMenu => 'Open menu';

  @override
  String get shell_switchLanguage => 'Language';

  @override
  String get shell_switchTheme => 'Switch theme';

  @override
  String get useful_copied => 'Copied';

  @override
  String get useful_copy => 'Copy';

  @override
  String get useful_description =>
      'This tab does not have any informative meaning for third-party users, it is only the commands I often use that I usually forget.';

  @override
  String get useful_title => 'Useful commands';
}
