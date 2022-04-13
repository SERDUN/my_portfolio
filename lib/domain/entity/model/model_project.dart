import 'model_project_description.dart';
import 'model_project_media.dart';
import 'model_project_tags.dart';

class ModelProject {
  final String name;
  final ModelProjectDescription description;
  final ModelProjectMedia media;
  final ModelProjectTags tags;

  ModelProject(
      {required this.name,
      required this.description,
      required this.media,
      required this.tags});
}
