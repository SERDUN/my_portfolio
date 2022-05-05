import '../entity/model/error/common/either.dart';
import '../entity/model/error/common/failure.dart';

abstract class BaseUseCase<A, R> {
  static const String defaultLanguage = "en";
  Future<Either<Failure, R>> execute({A? argument});
}
