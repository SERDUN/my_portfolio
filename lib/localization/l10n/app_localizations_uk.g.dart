// ignore_for_file: non_constant_identifier_names

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get common_allProjects => 'Усі проєкти';

  @override
  String get common_appStore => 'App Store';

  @override
  String get common_downloadCv => 'Отримати резюме';

  @override
  String get common_github => 'GitHub';

  @override
  String get common_googlePlay => 'Google Play';

  @override
  String get common_loadFailed => 'Не вдалося завантажити сторінку.';

  @override
  String get common_retry => 'Спробувати ще';

  @override
  String get contacts_description =>
      'Пошта найшвидша. Решта посилань ведуть туди, де я пишу і відповідаю.';

  @override
  String get contacts_title => 'Контакти';

  @override
  String home_allProjects(int count) {
    return 'Усі проєкти: $count';
  }

  @override
  String get home_seeProjects => 'Переглянути проєкти';

  @override
  String get home_selectedWorkEyebrow => 'Вибрані роботи';

  @override
  String get home_selectedWorkTitle => 'Три проєкти для початку';

  @override
  String get home_skillsDescription =>
      'Згруповано так, як я користуюся ними щодня: спершу Flutter, під ним Android-коріння, і те, що навколо клієнта.';

  @override
  String get home_skillsEyebrow => 'Навики';

  @override
  String get home_skillsTitle => 'З чим я працюю';

  @override
  String get home_statsPlatforms => 'платформи';

  @override
  String get home_statsProjects => 'проєктів';

  @override
  String get home_statsYears => 'років у мобільній розробці';

  @override
  String get notFound_description => 'російський корабель йди на х*й';

  @override
  String get notFound_home => 'На головну';

  @override
  String get notFound_title => '404';

  @override
  String get project_aboutTitle => 'Про проєкт';

  @override
  String get project_factPlatforms => 'Платформи';

  @override
  String get project_factScreens => 'Екранів';

  @override
  String get project_factStack => 'Стек';

  @override
  String get project_next => 'Наступний проєкт';

  @override
  String get project_notFound => 'Такого проєкту немає.';

  @override
  String get project_platformAndroid => 'Android';

  @override
  String get project_platformIos => 'iOS';

  @override
  String get project_platformWeb => 'Web';

  @override
  String project_screensCount(int count) {
    return 'Екранів: $count';
  }

  @override
  String get project_screenshotsTitle => 'Скріншоти';

  @override
  String get project_stackTitle => 'Стек залежностей';

  @override
  String get projects_cta => 'Хочете щось подібне? Напишіть';

  @override
  String get projects_description =>
      'Застосунки в сторах і клієнтські проєкти за останні роки. Flutter там, де команда хотіла одну кодову базу, нативний Android там, де без нього ніяк.';

  @override
  String get projects_eyebrow => 'Проєкти';

  @override
  String get projects_filterAll => 'Усі';

  @override
  String projects_title(int count, int platforms) {
    return '$count застосунків, $platforms платформи, одна звичка: доводити до релізу.';
  }

  @override
  String get shell_footerGlory => 'Слава Україні';

  @override
  String get shell_footerSource => 'Код на GitHub';

  @override
  String get shell_footerTitle => 'Поговорімо про ваш наступний застосунок.';

  @override
  String get shell_navContacts => 'Контакти';

  @override
  String get shell_navHome => 'Резюме';

  @override
  String get shell_navProjects => 'Проєкти';

  @override
  String get shell_navUseful => 'Корисне';

  @override
  String get shell_openMenu => 'Відкрити меню';

  @override
  String get shell_switchLanguage => 'Мова';

  @override
  String get shell_switchTheme => 'Змінити тему';

  @override
  String get useful_copied => 'Скопійовано';

  @override
  String get useful_copy => 'Копіювати';

  @override
  String get useful_description =>
      'Ця вкладка не має інформаційного значення для користувачів третьої сторони, в ній лише команди, які я часто використовую, і я зазвичай забуваю.';

  @override
  String get useful_title => 'Корисні команди';
}
