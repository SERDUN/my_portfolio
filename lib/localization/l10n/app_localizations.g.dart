import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.g.dart';
import 'app_localizations_uk.g.dart';

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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('uk')
  ];

  /// No description provided for @last_project_title.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get last_project_title;

  /// No description provided for @menu_title_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get menu_title_home;

  /// No description provided for @menu_title_portfolio.
  ///
  /// In en, this message translates to:
  /// **'Portfolio'**
  String get menu_title_portfolio;

  /// No description provided for @menu_title_contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get menu_title_contact;

  /// No description provided for @button_download_cv.
  ///
  /// In en, this message translates to:
  /// **'Download CV'**
  String get button_download_cv;

  /// No description provided for @unknown_page_title.
  ///
  /// In en, this message translates to:
  /// **'404'**
  String get unknown_page_title;

  /// No description provided for @unknown_page_description.
  ///
  /// In en, this message translates to:
  /// **'Fuck russia!'**
  String get unknown_page_description;

  /// No description provided for @portfolio_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get portfolio_description;

  /// No description provided for @portfolio_about_me.
  ///
  /// In en, this message translates to:
  /// **'About me'**
  String get portfolio_about_me;

  /// No description provided for @intro_skills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get intro_skills;

  /// No description provided for @contact_get_in_touch.
  ///
  /// In en, this message translates to:
  /// **'Get in touch'**
  String get contact_get_in_touch;

  /// No description provided for @contact_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get contact_phone;

  /// No description provided for @contact_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contact_email;

  /// No description provided for @contact_location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get contact_location;

  /// No description provided for @contact_facebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get contact_facebook;

  /// No description provided for @contact_linkedin.
  ///
  /// In en, this message translates to:
  /// **'Linkedin'**
  String get contact_linkedin;

  /// No description provided for @contact_instagram.
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get contact_instagram;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'uk': return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
