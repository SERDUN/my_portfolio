import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

/// The pre-rendered paths. English lives at the root, every other language
/// under its code (`/uk`, `/uk/portfolio`), so each page has one URL per
/// language and the language switch is a plain link.
abstract final class SitePaths {
  /// [route] as `AppRoutes` spells it, in [language].
  static String of(Language language, String route) {
    if (language == Language.fallback) return route;
    return route == '/' ? '/${language.code}' : '/${language.code}$route';
  }

  static String home(Language language) => of(language, AppRoutes.home.path);

  static String projects(Language language) => of(language, AppRoutes.projects.path);

  static String project(Language language, String id) => of(language, '${AppRoutes.projects.path}/$id');

  static String contacts(Language language) => of(language, AppRoutes.contacts.path);

  static String useful(Language language) => of(language, AppRoutes.useful.path);
}
