import 'package:test/test.dart';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

import 'package:my_portfolio_jaspr/services/file_asset_loader.dart';

class _FixedLanguage implements LanguageSource {
  const _FixedLanguage(this.language);

  @override
  final Language language;

  @override
  Stream<Language> get languageChanges => const Stream.empty();
}

/// The Jaspr presenter drives the same chain as the Flutter app: bundled JSON
/// through package/data, a domain use case, a shared cubit.
void main() {
  // `dart test` runs in apps/jaspr.
  final source = AssetsDataSource(const FileAssetLoader('../../package/data'));

  test('a shared cubit loads the bundled content in each language', () async {
    for (final language in Language.values) {
      final cubit = ShellCubit(GetUserUseCaseImpl(UserRepositoryImpl(source)), _FixedLanguage(language));
      final state = await cubit.stream.firstWhere((s) => s.user != null);
      expect(state.user!.firstName, isNotEmpty, reason: '$language');
      await cubit.close();
    }
  });
}
