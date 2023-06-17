import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:injectable/injectable.dart';

import 'package:domain/entity/entity.dart';

@Singleton()
class AssetsDataSource {
  Future<PortfolioDTO> getProjectData(String localization) async {
    String data = localization == "en"
        ? await rootBundle.loadString('packages/data/assets/data/en/projects.json')
        : await rootBundle.loadString('packages/data/assets/data/uk/projects.json');

    var jsonResult = json.decode(data);
    PortfolioDTO portfolioDTO = PortfolioDTO.fromJson(jsonResult);
    return Future.value(portfolioDTO);
  }

  Future<ContactsDTO> getContactData() async {
    String data = await rootBundle.loadString('packages/data/assets/data/contact.json');
    var jsonResult = json.decode(data);
    ContactsDTO contacts = ContactsDTO.fromJson(jsonResult);
    return Future.value(contacts);
  }

  Future<PortfolioUserDTO> getUserData(String localization) async {
    String data = localization == "en"
        ? await rootBundle.loadString('packages/data/assets/data/en/user.json')
        : await rootBundle.loadString('packages/data/assets/data/uk/user.json');
    var jsonResult = json.decode(data);
    PortfolioUserDTO portfolioDTO = PortfolioUserDTO.fromJson(jsonResult);
    return Future.value(portfolioDTO);
  }
}
