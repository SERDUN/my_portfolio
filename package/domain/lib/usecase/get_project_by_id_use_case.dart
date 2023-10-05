import 'package:injectable/injectable.dart';

import 'package:data/data.dart';

import 'package:domain/entity/entity.dart';
import 'package:domain/repository/repository.dart';
import 'package:domain/common/common.dart';

abstract class GetProjectByIdUseCase {
  Stream<ProjectModel> execute({
    required String id,
  });
}

@Injectable(as: GetProjectByIdUseCase)
class GetProjectByIdUseCaseImpl implements GetProjectByIdUseCase {
  GetProjectByIdUseCaseImpl(
    this.config,
    this.userRepository,
    this.mapper,
  );

  final Config config;
  final ProjectRepository userRepository;
  final Mapper<ProjectDTO, ProjectModel> mapper;

  @override
  Stream<ProjectModel> execute({
    required String id,
  }) {
    return userRepository.getProjectById(id, config.currentLocale).map((event) => mapper.mapToModel(event));
  }
}
