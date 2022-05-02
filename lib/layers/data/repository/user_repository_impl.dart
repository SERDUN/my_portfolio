import 'package:injectable/injectable.dart';
import 'package:my_portfolio/layers/domain/entity/dto/contacts_dto.dart';
import 'package:my_portfolio/layers/domain/entity/dto/portfolio_user_dto.dart';
import 'package:my_portfolio/layers/domain/entity/model/error/common/default_error.dart';
import 'package:my_portfolio/layers/domain/entity/model/error/common/either.dart';
import 'package:my_portfolio/layers/domain/entity/model/error/common/failure.dart';

import '../../domain/repository/user_repository.dart';
import '../datasource/local/assets_data_source.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final AssetsDataSource source;

  UserRepositoryImpl(this.source);

  @override
  Future<Either<Failure, PortfolioUserDTO>> getUser(String localization) async {
    try {
      PortfolioUserDTO user = await source.getUserData(localization);
      return Future.value(Right(user));
    } on Exception catch (e) {
      //Logic for handle depend from datasource
      return Future.value(Left(DefaultFailure(e.toString())));
    }
  }

  @override
  Future<Either<Failure, ContactsDTO>> getContacts() async {
    try {
      ContactsDTO user = await source.getContactData();
      return Future.value(Right(user));
    } on Exception catch (e) {
      //Logic for handle depend from datasource
      return Future.value(Left(DefaultFailure(e.toString())));
    }
  }
}
