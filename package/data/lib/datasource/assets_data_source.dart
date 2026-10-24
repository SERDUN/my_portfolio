import 'dart:convert';

import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../dto/dto.dart';
import '../gen/gen.dart';
import 'portfolio_data_source.dart';

/// Reads the JSON bundled under `assets/data/<language>/`. Always registered:
/// the command cheat sheet has no other source, whatever the environment.
@lazySingleton
class AssetsDataSource implements PortfolioDataSource {
  @override
  Future<List<ProjectDTO>> getProjects(Language language) async {
    final json = jsonDecode(await Assets.data.projects(language)) as List;
    return json.map((item) => ProjectDTO.fromJson(item as Map<String, dynamic>)).toList();
  }

  @override
  Future<ProjectDTO> getProject(String id, Language language) async {
    final projects = await getProjects(language);
    return projects.firstWhere((project) => project.id == id);
  }

  @override
  Future<List<ContactsDTO>> getContacts(Language language) async {
    final json = jsonDecode(await Assets.data.contact(language)) as List;
    return json.map((item) => ContactsDTO.fromJson(item as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<PortfolioSkillsDTO>> getSkills(Language language) async {
    final json = jsonDecode(await Assets.data.skills(language)) as List;
    return json.map((item) => PortfolioSkillsDTO.fromJson(item as Map<String, dynamic>)).toList();
  }

  /// Not part of [PortfolioDataSource]: the API has no endpoint for it.
  Future<List<UsefulCommandsDTO>> getUsefulCommand(Language language) async {
    final json = jsonDecode(await Assets.data.usefulCommands(language)) as List;
    return json.map((item) => UsefulCommandsDTO.fromJson(item as Map<String, dynamic>)).toList();
  }

  @override
  Future<PortfolioUserDTO> getUser(Language language) async {
    final json = jsonDecode(await Assets.data.user(language)) as Map<String, dynamic>;
    return PortfolioUserDTO.fromJson(json);
  }
}
