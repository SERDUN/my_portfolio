// ignore_for_file: non_constant_identifier_names
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.g.dart';
import 'app_localizations_uk.g.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.g.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('uk'),
  ];

  /// Link back to the project list
  ///
  /// In en, this message translates to:
  /// **'All projects'**
  String get common_allProjects;

  /// App Store name
  ///
  /// In en, this message translates to:
  /// **'App Store'**
  String get common_appStore;

  /// Button that opens the CV
  ///
  /// In en, this message translates to:
  /// **'Download CV'**
  String get common_downloadCv;

  /// GitHub name
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get common_github;

  /// Google Play store name
  ///
  /// In en, this message translates to:
  /// **'Google Play'**
  String get common_googlePlay;

  /// Message when a page could not load
  ///
  /// In en, this message translates to:
  /// **'Could not load this page.'**
  String get common_loadFailed;

  /// Button that retries a failed load
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get common_retry;

  /// Screen reader name of the one-button language toggle: the visible code, then what a tap does
  ///
  /// In en, this message translates to:
  /// **'{code}, switch language to {next}'**
  String common_semanticsLabel_languageCompact(String code, String next);

  /// Screen reader name of one language pill: the visible code, then the language name
  ///
  /// In en, this message translates to:
  /// **'{code}, {name}'**
  String common_semanticsLabel_languageOption(String code, String name);

  /// Description under the contacts title
  ///
  /// In en, this message translates to:
  /// **'Email is the fastest way. The other links lead where I post and answer.'**
  String get contacts_description;

  /// Screen reader name of a contact card: channel and address
  ///
  /// In en, this message translates to:
  /// **'{title}: {value}'**
  String contacts_semanticsLabel_openChannel(String title, String value);

  /// Title of the contacts page
  ///
  /// In en, this message translates to:
  /// **'Get in touch'**
  String get contacts_title;

  /// Link from the featured projects to the full list, with the total count
  ///
  /// In en, this message translates to:
  /// **'All {count} projects'**
  String home_allProjects(int count);

  /// Hero button to the project list
  ///
  /// In en, this message translates to:
  /// **'See projects'**
  String get home_seeProjects;

  /// Eyebrow above the featured projects
  ///
  /// In en, this message translates to:
  /// **'Selected work'**
  String get home_selectedWorkEyebrow;

  /// Title of the featured projects section
  ///
  /// In en, this message translates to:
  /// **'Three projects to start with'**
  String get home_selectedWorkTitle;

  /// Description next to the skills title
  ///
  /// In en, this message translates to:
  /// **'Grouped the way I use them day to day: Flutter first, the Android roots underneath, and the things around the client.'**
  String get home_skillsDescription;

  /// Eyebrow above the skills section
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get home_skillsEyebrow;

  /// Title of the skills section
  ///
  /// In en, this message translates to:
  /// **'What I work with'**
  String get home_skillsTitle;

  /// Caption under the platform count
  ///
  /// In en, this message translates to:
  /// **'platforms'**
  String get home_statsPlatforms;

  /// Caption under the project count
  ///
  /// In en, this message translates to:
  /// **'projects'**
  String get home_statsProjects;

  /// Caption under the years-of-experience number
  ///
  /// In en, this message translates to:
  /// **'years in mobile'**
  String get home_statsYears;

  /// Message of the 404 page
  ///
  /// In en, this message translates to:
  /// **'Fuck Russia!'**
  String get notFound_description;

  /// Button from the 404 page to the home page
  ///
  /// In en, this message translates to:
  /// **'Back home'**
  String get notFound_home;

  /// Title of the 404 page
  ///
  /// In en, this message translates to:
  /// **'404'**
  String get notFound_title;

  /// Title of the project description section
  ///
  /// In en, this message translates to:
  /// **'About the project'**
  String get project_aboutTitle;

  /// Label of the platforms fact in the project hero
  ///
  /// In en, this message translates to:
  /// **'Platforms'**
  String get project_factPlatforms;

  /// Label of the screen count fact in the project hero
  ///
  /// In en, this message translates to:
  /// **'Screens'**
  String get project_factScreens;

  /// Label of the stack size fact in the project hero
  ///
  /// In en, this message translates to:
  /// **'Stack'**
  String get project_factStack;

  /// Label before the link to the next project
  ///
  /// In en, this message translates to:
  /// **'Next project'**
  String get project_next;

  /// Message for a project id that does not exist
  ///
  /// In en, this message translates to:
  /// **'There is no such project.'**
  String get project_notFound;

  /// Platform name derived from a Google Play link
  ///
  /// In en, this message translates to:
  /// **'Android'**
  String get project_platformAndroid;

  /// Platform name derived from an App Store link
  ///
  /// In en, this message translates to:
  /// **'iOS'**
  String get project_platformIos;

  /// Platform name for a web project
  ///
  /// In en, this message translates to:
  /// **'Web'**
  String get project_platformWeb;

  /// Count next to the gallery title
  ///
  /// In en, this message translates to:
  /// **'{count} screens'**
  String project_screensCount(int count);

  /// Title of the screenshot gallery
  ///
  /// In en, this message translates to:
  /// **'Screenshots'**
  String get project_screenshotsTitle;

  /// Screen reader name of the next project link
  ///
  /// In en, this message translates to:
  /// **'Next project: {name}'**
  String project_semanticsLabel_nextProject(String name);

  /// Title of the technology stack section
  ///
  /// In en, this message translates to:
  /// **'Dependency stack'**
  String get project_stackTitle;

  /// Link to the contacts page at the end of the project list
  ///
  /// In en, this message translates to:
  /// **'Want one like these? Get in touch'**
  String get projects_cta;

  /// Description under the project list title
  ///
  /// In en, this message translates to:
  /// **'Store apps and client work from the last years. Flutter where the team wanted one codebase, native Android where it had to be.'**
  String get projects_description;

  /// Eyebrow of the project list page
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects_eyebrow;

  /// Filter chip that shows every project
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get projects_filterAll;

  /// Screen reader name of a project card: name, then its summary, platform and stack
  ///
  /// In en, this message translates to:
  /// **'{name}. {summary}'**
  String projects_semanticsLabel_openProject(String name, String summary);

  /// Statement title of the project list, with project and platform counts
  ///
  /// In en, this message translates to:
  /// **'{count} apps, {platforms} platforms, one habit: ship it clean.'**
  String projects_title(int count, int platforms);

  /// Footer line next to the Ukrainian flag
  ///
  /// In en, this message translates to:
  /// **'Glory to Ukraine'**
  String get shell_footerGlory;

  /// Footer link to the source code
  ///
  /// In en, this message translates to:
  /// **'Source on GitHub'**
  String get shell_footerSource;

  /// Headline of the footer contact band
  ///
  /// In en, this message translates to:
  /// **'Let\'s talk about your next app.'**
  String get shell_footerTitle;

  /// Header and menu link to the contacts page; also the footer eyebrow
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get shell_navContacts;

  /// Header and menu link to the home page
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get shell_navHome;

  /// Header and menu link to the project list
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get shell_navProjects;

  /// Menu link and eyebrow of the useful commands page
  ///
  /// In en, this message translates to:
  /// **'Useful'**
  String get shell_navUseful;

  /// Tooltip of the mobile menu button
  ///
  /// In en, this message translates to:
  /// **'Open menu'**
  String get shell_openMenu;

  /// Screen reader name of the wordmark, which opens the home page
  ///
  /// In en, this message translates to:
  /// **'{name}, home page'**
  String shell_semanticsLabel_wordmark(String name);

  /// Accessibility label of the language toggle
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get shell_switchLanguage;

  /// Tooltip of the theme button
  ///
  /// In en, this message translates to:
  /// **'Switch theme'**
  String get shell_switchTheme;

  /// Confirmation after a command was copied
  ///
  /// In en, this message translates to:
  /// **'Copied'**
  String get useful_copied;

  /// Button that copies a command
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get useful_copy;

  /// Description of the useful commands page
  ///
  /// In en, this message translates to:
  /// **'This tab does not have any informative meaning for third-party users, it is only the commands I often use that I usually forget.'**
  String get useful_description;

  /// Screen reader name and announcement after a command was copied
  ///
  /// In en, this message translates to:
  /// **'Copied: {title}'**
  String useful_semanticsLabel_copied(String title);

  /// Screen reader name of a copy button, naming the command
  ///
  /// In en, this message translates to:
  /// **'Copy: {title}'**
  String useful_semanticsLabel_copy(String title);

  /// Title of the useful commands page
  ///
  /// In en, this message translates to:
  /// **'Useful commands'**
  String get useful_title;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
