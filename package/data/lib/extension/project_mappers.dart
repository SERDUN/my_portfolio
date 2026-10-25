import 'dart:developer' as developer;

import 'package:domain/domain.dart';

import '../dto/dto.dart';
import 'uri_parsing.dart';

extension ProjectDtoMapper on ProjectDTO {
  /// Throws [FormatException] for a project without an id or a name: those
  /// are routing keys and titles, so such a record is broken, not partial.
  ProjectModel toDomain() {
    final id = this.id?.trim() ?? '';
    final name = this.name?.trim() ?? '';
    if (id.isEmpty || name.isEmpty) throw FormatException('project without id or name', toJson().toString());
    return ProjectModel(
      id: id,
      name: name,
      intro: intro?.trim() ?? '',
      // The JSON keeps trailing newlines from the editor.
      description: description?.trim() ?? '',
      platform: _platform(id),
      links: ProjectLinks(
        googlePlay: parseWebUri(linkAndroid, field: 'project $id linkAndroid'),
        appStore: parseWebUri(linkIOS, field: 'project $id linkIOS'),
        github: parseWebUri(linkGithub, field: 'project $id linkGithub'),
      ),
      spheres: spheres,
      technologies: technologies,
      screenshots: screenshots.map((s) => parseWebUri(s, field: 'project $id screenshot')).whereType<Uri>().toList(),
      preview: parseWebUri(preview, field: 'project $id preview'),
      featured: featured,
    );
  }

  /// The explicit field when it names a platform; otherwise the first
  /// platform the stack names. An explicit value that matches nothing is
  /// logged: it is a typo in the data, not a new platform.
  ProjectPlatform? _platform(String id) {
    final explicit = platform?.trim().toLowerCase() ?? '';
    if (explicit.isNotEmpty) {
      final match = _match(explicit);
      if (match != null) return match;
      developer.log('project $id has unknown platform "$platform"', name: 'data');
    }
    for (final tech in technologies) {
      final match = _match(tech.trim().toLowerCase());
      if (match != null) return match;
    }
    return null;
  }

  static ProjectPlatform? _match(String value) {
    for (final platform in ProjectPlatform.values) {
      if (platform.name == value) return platform;
    }
    return null;
  }
}

extension ProjectDtoListMapper on List<ProjectDTO> {
  /// Maps every valid project and skips (and logs) broken ones, so one bad
  /// record from the API never empties the whole portfolio.
  List<ProjectModel> toDomain() {
    final models = <ProjectModel>[];
    for (final dto in this) {
      try {
        models.add(dto.toDomain());
      } on FormatException catch (error) {
        developer.log('skipped a project: ${error.message}', name: 'data', error: error);
      }
    }
    return models;
  }
}
