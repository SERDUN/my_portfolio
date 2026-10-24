// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get menuTitleHome => 'Резюме';

  @override
  String get menuTitlePortfolio => 'Проєкти';

  @override
  String get menuTitleContact => 'Контакти';

  @override
  String get menuTitleUseful => 'Корисне';

  @override
  String get featureUsefulTitle => 'Корисні команди';

  @override
  String get featureUsefulDescription =>
      'Ця вкладка не має інформаційного значення для користувачів третьої сторони, в ній лише команди, які я часто використовую, і я зазвичай забуваю.';

  @override
  String get lastProjectTitle => 'Проєкти';

  @override
  String get buttonDownloadCv => 'Отримати резюме';

  @override
  String get unknownPageTitle => '404';

  @override
  String get unknownPageDescription => 'російський корабель йди на х*й';

  @override
  String get portfolioDescription => 'Опис';

  @override
  String get portfolioAboutMe => 'Про мене';

  @override
  String get projectDependencyStack => 'Стек залежностей';

  @override
  String get projectScreenshots => 'Скріншоти';

  @override
  String get introSkills => 'Навики';

  @override
  String get contactGetInTouch => 'Контакти';

  @override
  String get contactPhone => 'Телефон';

  @override
  String get contactEmail => 'Електронна пошта';

  @override
  String get contactLocation => 'Розташування';

  @override
  String get contactFacebook => 'Фейсбук';

  @override
  String get contactLinkedin => 'Лінкед';

  @override
  String get contactInstagram => 'Інста';

  @override
  String get footerContactTitle => 'Поговорімо про ваш наступний застосунок.';

  @override
  String get footerSource => 'Код на GitHub';

  @override
  String get footerGlory => 'Слава Україні';

  @override
  String get actionOpenMenu => 'Відкрити меню';

  @override
  String get actionSwitchTheme => 'Змінити тему';

  @override
  String get actionSwitchLanguage => 'Мова';

  @override
  String get buttonSeeProjects => 'Переглянути проєкти';

  @override
  String get statsYears => 'років у мобільній розробці';

  @override
  String get statsProjects => 'проєктів';

  @override
  String get statsPlatforms => 'платформи';

  @override
  String get skillsTitle => 'З чим я працюю';

  @override
  String get skillsDescription =>
      'Згруповано так, як я користуюся ними щодня: спершу Flutter, під ним Android-коріння, і те, що навколо клієнта.';

  @override
  String get selectedWorkEyebrow => 'Вибрані роботи';

  @override
  String get selectedWorkTitle => 'Три проєкти для початку';

  @override
  String allProjects(int count) {
    return 'Усі проєкти: $count';
  }

  @override
  String projectsTitle(int count, int platforms) {
    return '$count застосунків, $platforms платформи, одна звичка: доводити до релізу.';
  }

  @override
  String get projectsDescription =>
      'Застосунки в сторах і клієнтські проєкти за останні роки. Flutter там, де команда хотіла одну кодову базу, нативний Android там, де без нього ніяк.';

  @override
  String get filterAll => 'Усі';

  @override
  String get projectsCta => 'Хочете щось подібне? Напишіть';

  @override
  String get storeGooglePlay => 'Google Play';

  @override
  String get storeAppStore => 'App Store';

  @override
  String get storeGithub => 'GitHub';

  @override
  String get backToProjects => 'Усі проєкти';

  @override
  String get projectAbout => 'Про проєкт';

  @override
  String get projectFactPlatforms => 'Платформи';

  @override
  String get projectFactStack => 'Стек';

  @override
  String get projectFactScreens => 'Екранів';

  @override
  String projectScreensCount(int count) {
    return 'Екранів: $count';
  }

  @override
  String get projectNext => 'Наступний проєкт';

  @override
  String get platformIos => 'iOS';

  @override
  String get platformAndroid => 'Android';

  @override
  String get platformWeb => 'Web';
}
