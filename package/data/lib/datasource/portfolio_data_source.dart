import 'package:domain/domain.dart';

import '../dto/dto.dart';

/// Where the portfolio content comes from. One implementation is bound per
/// [DataEnvironment]; repositories depend on this contract only.
abstract class PortfolioDataSource {
  Future<PortfolioUserDTO> getUser(Language language);

  Future<List<SkillGroupDTO>> getSkills(Language language);

  Future<List<ContactDTO>> getContacts(Language language);

  Future<List<ProjectDTO>> getProjects(Language language);

  /// Throws [ProjectNotFoundException] when no project has [id].
  Future<ProjectDTO> getProject(String id, Language language);
}
