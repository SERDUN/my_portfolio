import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:injectable/injectable.dart';

import 'package:domain/entity/entity.dart';

@Singleton()
class AssetsDataSource {
  Future<List<ProjectDTO>> getProjects(String localization) async {
    String data = localization == "en"
        ? await rootBundle.loadString('packages/data/assets/data/en/projects.json')
        : await rootBundle.loadString('packages/data/assets/data/uk/projects.json');

    var jsonResult = jsonDecode(data) as List;
    List<ProjectDTO> projects = jsonResult.map((data) => ProjectDTO.fromJson(data)).toList();
    return Future.value(projects);
  }

  Future<List<ContactsDTO>> getContacts() async {
    String data = await rootBundle.loadString('packages/data/assets/data/contact.json');
    var jsonResult = json.decode(data) as List;
    List<ContactsDTO> contacts = jsonResult.map((data) => ContactsDTO.fromJson(data)).toList();
    return Future.value(contacts);
  }

  Future<List<PortfolioSkillsDTO>> getSkills() async {
    String data = await rootBundle.loadString('packages/data/assets/data/en/skills.json');
    var jsonResult = json.decode(data) as List;
    List<PortfolioSkillsDTO> skills = jsonResult.map((data) => PortfolioSkillsDTO.fromJson(data)).toList();
    return Future.value(skills);
  }

  Future<PortfolioUserDTO> getUser(String localization) async {
    String data = localization == "en"
        ? await rootBundle.loadString('packages/data/assets/data/en/user.json')
        : await rootBundle.loadString('packages/data/assets/data/uk/user.json');
    var jsonResult = json.decode(data);
    PortfolioUserDTO portfolioDTO = PortfolioUserDTO.fromJson(jsonResult);
    return Future.value(portfolioDTO);
  }
}