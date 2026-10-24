import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/app/settings/settings.dart';
import 'package:my_portfolio/features/shell/shell.dart';

class _User implements GetUserUseCase {
  final controller = StreamController<PortfolioUserModel>.broadcast();
  int executions = 0;

  @override
  Stream<PortfolioUserModel> execute({required Language language}) {
    executions++;
    return controller.stream;
  }
}

void main() {
  late _User user;
  late AppSettingsCubit settings;
  late ShellCubit cubit;

  final owner = PortfolioUserModel(
    firstName: 'A',
    secondName: 'B',
    position: '',
    intro: '',
    cv: Uri.parse('https://cv.example'),
  );

  setUp(() {
    user = _User();
    settings = AppSettingsCubit();
    cubit = ShellCubit(user, settings);
  });

  tearDown(() async {
    await cubit.close();
    await settings.close();
    await user.controller.close();
  });

  test('loads the owner once for every page', () async {
    expect(user.executions, 1);
    user.controller.add(owner);
    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.user, owner);
  });

  test('a failure leaves the header on its fallback and is not thrown', () async {
    user.controller.addError(Exception('profile down'));
    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.user, isNull);
  });

  test('reloads with the new language', () async {
    settings.changeLanguage(Language.uk);
    await Future<void>.delayed(Duration.zero);
    expect(user.executions, 2);
  });
}
