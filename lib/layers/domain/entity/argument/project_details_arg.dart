import 'package:my_portfolio/layers/domain/common/base_use_case_arg.dart';

class ProjectDetailsArg extends BaseUseCaseArg {
  final String id;

  ProjectDetailsArg(String? local, this.id) : super(local);
}
