import 'package:domain/domain.dart';

import '../dto/dto.dart';
import 'portfolio_data_source.dart';

/// Asks [primary] first and answers from [fallback] when it fails, so a down
/// or slow API never leaves a page empty while the bundled content exists.
/// A missing project ([ProjectNotFoundException]) is a real answer and is
/// not retried.
class FallbackDataSource implements PortfolioDataSource {
  FallbackDataSource({required this.primary, required this.fallback});

  final PortfolioDataSource primary;
  final PortfolioDataSource fallback;

  Future<T> _either<T>(Future<T> Function(PortfolioDataSource source) call) async {
    try {
      return await call(primary);
    } on ProjectNotFoundException {
      rethrow;
    } catch (_) {
      return call(fallback);
    }
  }

  @override
  Future<PortfolioUserDTO> getUser(Language language) => _either((s) => s.getUser(language));

  @override
  Future<List<PortfolioSkillsDTO>> getSkills(Language language) => _either((s) => s.getSkills(language));

  @override
  Future<List<ContactsDTO>> getContacts(Language language) => _either((s) => s.getContacts(language));

  @override
  Future<List<ProjectDTO>> getProjects(Language language) => _either((s) => s.getProjects(language));

  @override
  Future<ProjectDTO> getProject(String id, Language language) => _either((s) => s.getProject(id, language));
}
