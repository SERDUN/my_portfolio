import 'package:domain/domain.dart';

import '../dto/project_dto.dart';

extension ProjectDtoMapper on ProjectDTO {
  /// Links default to empty strings; the description is trimmed because the
  /// JSON keeps trailing newlines from the editor.
  ProjectModel toDomain() => ProjectModel(
        id: id,
        name: name,
        intro: intro,
        description: description?.trim(),
        linkAndroid: linkAndroid ?? '',
        linkIOS: linkIOS ?? '',
        linkGithub: linkGithub ?? '',
        spheres: spheres,
        technologies: technologies,
        screenshots: screenshots,
        preview: preview,
        featured: featured,
      );
}

extension ProjectDtoListMapper on List<ProjectDTO> {
  List<ProjectModel> toDomain() => map((dto) => dto.toDomain()).toList();
}
