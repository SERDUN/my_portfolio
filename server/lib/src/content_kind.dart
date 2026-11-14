import 'package:contract/contract.dart';

/// The languages the content is written in.
const List<String> contentLanguages = ['en', 'uk'];

/// One document of the content per language. The name is both the URL
/// segment and the asset file name the app reads (`<name>.json`).
enum ContentKind {
  user('user'),
  skills('skills'),
  contacts('contact'),
  projects('projects'),
  commands('useful_commands');

  const ContentKind(this.fileName);

  /// The asset file the app bundles this kind as, without `.json`.
  final String fileName;

  static ContentKind? byName(String name) {
    for (final kind in values) {
      if (kind.name == name) return kind;
    }
    return null;
  }

  /// Throws [ContentValidationException] unless [json] parses into the DTOs
  /// the app reads, so a broken document never reaches a build.
  void validate(Object? json) {
    try {
      switch (this) {
        case ContentKind.user:
          final user = PortfolioUserDTO.fromJson(_map(json));
          if ((user.firstName ?? '').isEmpty) throw ContentValidationException('user.first_name is required');
        case ContentKind.skills:
          _list(json).forEach((item) => SkillGroupDTO.fromJson(_map(item)));
        case ContentKind.contacts:
          _list(json).forEach((item) => ContactDTO.fromJson(_map(item)));
        case ContentKind.commands:
          _list(json).forEach((item) => CommandGroupDTO.fromJson(_map(item)));
        case ContentKind.projects:
          final ids = <String>{};
          for (final item in _list(json)) {
            final project = ProjectDTO.fromJson(_map(item));
            final id = project.id ?? '';
            if (id.isEmpty || (project.name ?? '').isEmpty) {
              throw ContentValidationException('every project needs an id and a name');
            }
            if (!ids.add(id)) throw ContentValidationException('duplicate project id "$id"');
          }
      }
    } on ContentValidationException {
      rethrow;
    } catch (e) {
      throw ContentValidationException('$name does not match the contract: $e');
    }
  }

  static Map<String, dynamic> _map(Object? json) {
    if (json is Map<String, dynamic>) return json;
    throw ContentValidationException('expected a JSON object');
  }

  static List<Object?> _list(Object? json) {
    if (json is List) return json;
    throw ContentValidationException('expected a JSON array');
  }
}

class ContentValidationException implements Exception {
  ContentValidationException(this.message);

  final String message;

  @override
  String toString() => message;
}
