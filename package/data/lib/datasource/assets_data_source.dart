import 'dart:convert';

import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../gen/gen.dart';

import '../dto/dto.dart';

@singleton
class AssetsDataSource {

  Future<List<ProjectDTO>> getProjects(Language language) async {
    String data = await Assets.data.projects(language);
    var jsonResult = jsonDecode(data) as List;
    List<ProjectDTO> projects = jsonResult.map((data) => ProjectDTO.fromJson(data)).toList();
    return Future.value(projects);
  }

  Future<ProjectDTO> getProject(String id, Language language) async {
    List<ProjectDTO> projects = await getProjects(language);
    return Future.value(projects.firstWhere((element) => element.id == id));
  }

  Future<List<ContactsDTO>> getContacts(Language language) async {
    String data = await Assets.data.contact(language);
    var jsonResult = json.decode(data) as List;
    List<ContactsDTO> contacts = jsonResult.map((data) => ContactsDTO.fromJson(data)).toList();
    return Future.value(contacts);
  }

  Future<List<PortfolioSkillsDTO>> getSkills(Language language) async {
    String data = await Assets.data.skills(language);
    var jsonResult = json.decode(data) as List;
    List<PortfolioSkillsDTO> skills = jsonResult.map((data) => PortfolioSkillsDTO.fromJson(data)).toList();
    return Future.value(skills);
  }

  Future<List<UsefulCommandsDTO>> getUsefulCommand(Language language) async {
    String data = await Assets.data.usefulCommands(language);
    var jsonResult = json.decode(data) as List;
    List<UsefulCommandsDTO> skills = jsonResult.map((data) => UsefulCommandsDTO.fromJson(data)).toList();
    return Future.value(skills);
  }

  Future<PortfolioUserDTO> getUser(Language language) async {
    String data = await Assets.data.user(language);
    var jsonResult = json.decode(data);
    PortfolioUserDTO portfolioDTO = PortfolioUserDTO.fromJson(jsonResult);
    return Future.value(portfolioDTO);
  }
}
