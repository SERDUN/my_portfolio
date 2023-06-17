import 'project_image_model.dart';

class ProjectMediaModel {
  final List<ProjectImageModel> screenshots;

  final ProjectImageModel preview;

  ProjectMediaModel({required this.screenshots, required this.preview});
}
