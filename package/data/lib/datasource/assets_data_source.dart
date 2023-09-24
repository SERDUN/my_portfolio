import 'dart:convert';

import 'package:data/gen/gen.dart';

import 'package:injectable/injectable.dart';

import '../dto/dto.dart';

@singleton
class AssetsDataSource {

  Future<List<ProjectDTO>> getProjects(String localization) async {
    String data = await Assets.data.projects(localization);
    var jsonResult = jsonDecode(data) as List;
    List<ProjectDTO> projects = jsonResult.map((data) => ProjectDTO.fromJson(data)).toList();
    return Future.value(projects);
  }

  Future<ProjectDTO> getProject(String id, String localization) async {
    List<ProjectDTO> projects = await getProjects(localization);
    return Future.value(projects.firstWhere((element) => element.id == id));
  }

  Future<List<ContactsDTO>> getContacts(String localization) async {
    String data = await Assets.data.contact(localization);
    var jsonResult = json.decode(data) as List;
    List<ContactsDTO> contacts = jsonResult.map((data) => ContactsDTO.fromJson(data)).toList();
    return Future.value(contacts);
  }

  Future<List<PortfolioSkillsDTO>> getSkills(String localization) async {
    String data = await Assets.data.skills(localization);
    var jsonResult = json.decode(data) as List;
    List<PortfolioSkillsDTO> skills = jsonResult.map((data) => PortfolioSkillsDTO.fromJson(data)).toList();
    return Future.value(skills);
  }

  Future<List<UsefulCommandsDTO>> getUsefulCommand(String localization) async {
    String data = await Assets.data.usefulCommands(localization);
    var jsonResult = json.decode(data) as List;
    List<UsefulCommandsDTO> skills = jsonResult.map((data) => UsefulCommandsDTO.fromJson(data)).toList();
    return Future.value(skills);
  }

  Future<PortfolioUserDTO> getUser(String localization) async {
    String data = await Assets.data.user(localization);
    var jsonResult = json.decode(data);
    PortfolioUserDTO portfolioDTO = PortfolioUserDTO.fromJson(jsonResult);
    return Future.value(portfolioDTO);
  }
}
