import 'package:bloc/bloc.dart';

import '../../../../../domain/usecase/config/update_local_config_use_case.dart';
import 'datasource_language_notifier_state.dart';

class DatasourceLanguageNotifierCubit
    extends Cubit<DatasourceLanguageNotifier> {
  final UpdateLocalConfigUseCase useCase;

  DatasourceLanguageNotifierCubit(this.useCase)
      : super(DatasourceLanguageNotifier().init());

  void updateDatasourceLanguage(String local) async {
    useCase.execute(argument: local);
  }
}
