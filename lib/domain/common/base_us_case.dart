
import 'package:daberli/layers/domain/entity/models/error/base/either.dart';
import 'package:daberli/layers/domain/entity/models/error/base/failure.dart';

abstract class BaseUseCase<A, R> {
  Future<Either<Failure, R>> execute({A? argument});
}
