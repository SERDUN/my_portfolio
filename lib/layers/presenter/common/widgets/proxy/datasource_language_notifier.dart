import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/datasource_language_notifier_cubit.dart';

class DatasourceLanguageNotifier extends StatelessWidget {
  final Widget root;

  const DatasourceLanguageNotifier({Key? key, required this.root})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<DatasourceLanguageNotifierCubit>(context);
    cubit.updateDatasourceLanguage(context.locale.languageCode);
    return root;
  }
}
