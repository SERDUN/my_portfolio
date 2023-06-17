import 'project_media_model.dart';
import 'project_tags_model.dart';

class ProjectModel {
  final String? id;
  final String? name;
  final String? intro;
  final String? description;
  final String linkAndroid;
  final String linkIOS;
  final String linkSource;
  final ProjectTagsModel tags;
  final ProjectMediaModel? media;

  ProjectModel({
    this.name,
    this.intro,
    this.description,
    required this.linkAndroid,
    required this.linkIOS,
    required this.linkSource,
    required this.tags,
    this.media,
    this.id,
  });
}
