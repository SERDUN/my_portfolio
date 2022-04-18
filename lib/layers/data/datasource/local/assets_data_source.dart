import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:my_portfolio/layers/domain/entity/dto/portfolio_user_dto.dart';

import '../../../domain/entity/dto/portfolio_dto.dart';

@Singleton()
class AssetsDataSource {
  @Singleton()
  Future<PortfolioDTO> getProjectData() async {
    String data = await rootBundle.loadString('assets/data/projects.json');
    var jsonResult = json.decode(data);
    PortfolioDTO portfolioDTO = PortfolioDTO.fromJson(jsonResult);
    return Future.value(portfolioDTO);
  }

  @Singleton()
  Future<PortfolioUserDTO> getUserData() async {
    String data = await rootBundle.loadString('assets/data/user.json');
    var jsonResult = json.decode(data);
    PortfolioUserDTO portfolioDTO = PortfolioUserDTO.fromJson(jsonResult);
    return Future.value(portfolioDTO);
  }
}
