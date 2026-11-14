import 'dart:convert';

import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../dto/dto.dart';
import '../assets/assets.dart';
import 'portfolio_data_source.dart';

/// Reads the JSON bundled under `assets/data/<language>/` through the
/// presenter's [AssetLoader]. Always registered: the command cheat sheet has no
/// other source, whatever the environment.
@lazySingleton
class AssetsDataSource implements PortfolioDataSource {
  AssetsDataSource(this._assets);

  final AssetLoader _assets;

  Future<String> _read(ContentAsset asset, Language language) => _assets.loadString(asset.path(language));

  @override
  Future<List<ProjectDTO>> getProjects(Language language) async {
    final json = jsonDecode(await _read(ContentAsset.projects, language)) as List;
    return json.map((item) => ProjectDTO.fromJson(item as Map<String, dynamic>)).toList();
  }

  @override
  Future<ProjectDTO> getProject(String id, Language language) async {
    final projects = await getProjects(language);
    for (final project in projects) {
      if (project.id == id) return project;
    }
    throw ProjectNotFoundException(id);
  }

  @override
  Future<List<ContactDTO>> getContacts(Language language) async {
    final json = jsonDecode(await _read(ContentAsset.contact, language)) as List;
    return json.map((item) => ContactDTO.fromJson(item as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<SkillGroupDTO>> getSkills(Language language) async {
    final json = jsonDecode(await _read(ContentAsset.skills, language)) as List;
    return json.map((item) => SkillGroupDTO.fromJson(item as Map<String, dynamic>)).toList();
  }

  /// Not part of [PortfolioDataSource]: the API has no endpoint for it.
  Future<List<CommandGroupDTO>> getUsefulCommand(Language language) async {
    final json = jsonDecode(await _read(ContentAsset.usefulCommands, language)) as List;
    return json.map((item) => CommandGroupDTO.fromJson(item as Map<String, dynamic>)).toList();
  }

  @override
  Future<PortfolioUserDTO> getUser(Language language) async {
    final json = jsonDecode(await _read(ContentAsset.user, language)) as Map<String, dynamic>;
    return PortfolioUserDTO.fromJson(json);
  }
}
