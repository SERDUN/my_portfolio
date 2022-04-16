import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entity/dto/portfolio_dto.dart';

@Singleton()
class AssetsDataSource {
  @Singleton()
  Future<PortfolioDTO> getStaticData() async {
    String data = await rootBundle.loadString('assets/data/static.json');
    var jsonResult = json.decode(data);
    PortfolioDTO portfolioDTO = PortfolioDTO.fromJson(jsonResult);
    return Future.value(portfolioDTO);
  }
}
