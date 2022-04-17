import '../entity/model/error/common/either.dart';
import '../entity/model/error/common/failure.dart';

abstract class BaseUseCase<A, R> {
  Future<Either<Failure, R>> execute({A? argument});
}
