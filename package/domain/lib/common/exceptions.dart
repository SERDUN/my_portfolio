/// The project with [id] does not exist in the requested language. A real
/// answer, not a transient failure: retrying will not change it.
class ProjectNotFoundException implements Exception {
  const ProjectNotFoundException(this.id);

  final String id;

  @override
  String toString() => 'ProjectNotFoundException($id)';
}
