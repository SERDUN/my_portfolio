// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get menuTitleHome => 'Home';

  @override
  String get menuTitlePortfolio => 'Projects';

  @override
  String get menuTitleContact => 'Contact';

  @override
  String get menuTitleUseful => 'Useful';

  @override
  String get featureUsefulTitle => 'Useful commands';

  @override
  String get featureUsefulDescription =>
      'This tab does not have any informative meaning for third-party users, it is only the commands I often use that I usually forget.';

  @override
  String get lastProjectTitle => 'Projects';

  @override
  String get buttonDownloadCv => 'Download CV';

  @override
  String get unknownPageTitle => '404';

  @override
  String get unknownPageDescription => 'Fuck Russia!';

  @override
  String get portfolioDescription => 'Description';

  @override
  String get portfolioAboutMe => 'About me';

  @override
  String get projectDependencyStack => 'Dependency stack';

  @override
  String get projectScreenshots => 'Screenshots';

  @override
  String get introSkills => 'Skills';

  @override
  String get contactGetInTouch => 'Get in touch';

  @override
  String get contactPhone => 'Phone';

  @override
  String get contactEmail => 'Email';

  @override
  String get contactLocation => 'Location';

  @override
  String get contactFacebook => 'Facebook';

  @override
  String get contactLinkedin => 'LinkedIn';

  @override
  String get contactInstagram => 'Instagram';

  @override
  String get footerContactTitle => 'Let\'s talk about your next app.';

  @override
  String get footerSource => 'Source on GitHub';

  @override
  String get footerGlory => 'Glory to Ukraine';

  @override
  String get actionOpenMenu => 'Open menu';

  @override
  String get actionSwitchTheme => 'Switch theme';

  @override
  String get actionSwitchLanguage => 'Language';

  @override
  String get buttonSeeProjects => 'See projects';

  @override
  String get statsYears => 'years in mobile';

  @override
  String get statsProjects => 'projects';

  @override
  String get statsPlatforms => 'platforms';

  @override
  String get skillsTitle => 'What I work with';

  @override
  String get skillsDescription =>
      'Grouped the way I use them day to day: Flutter first, the Android roots underneath, and the things around the client.';

  @override
  String get selectedWorkEyebrow => 'Selected work';

  @override
  String get selectedWorkTitle => 'Three projects to start with';

  @override
  String allProjects(int count) {
    return 'All $count projects';
  }
}
