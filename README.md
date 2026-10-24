# my_portfolio

Personal portfolio of Dmytro Serdun, a Flutter web app: https://serdun.online/

## Layout

| Path | What it is |
|---|---|
| `lib/` | the app: `bootstrap.dart`, routing and theme in `app/`, screens in `features/`, shared widgets in `core/`, l10n in `localization/` |
| `package/domain/` | pure Dart: entities, repository contracts, use cases; depends on nothing but `injectable` |
| `package/data/` | DTOs, DTO → model mappers (`lib/extension/`), repository implementations, the JSON content under `assets/data/{en,uk}/` |
| `web/` | web shell: `index.html`, manifest, icons |
| `firebase/` | Firebase project: Cloud Functions (TypeScript), hosting, Firestore and Storage rules |

The app is built with `material_ui`, `flex_color_scheme`, `go_router`, `bloc`, `get_it` + `injectable` and `freezed`.

## Requirements

Flutter 3.47 or newer (Dart 3.13). The `pubspec.yaml` SDK floor is Flutter 3.32 / Dart 3.8.

## Setup

Generated code is only partly committed: `.g.dart`, `.freezed.dart` and the micro-package `*.module.dart` files are in git, but the root DI config `lib/di/injection.config.dart` is gitignored. A fresh clone therefore needs code generation before it builds:

```sh
flutter pub get
(cd package/domain && dart run build_runner build)
(cd package/data && dart run build_runner build)
dart run build_runner build
```

Re-run the last three commands after changing anything annotated with `@injectable`, `@freezed` or `@JsonSerializable`. Localizations (`lib/localization/l10n/*.g.dart`) are regenerated automatically by `flutter pub get` and `flutter build` from the ARB files in `lib/localization/l10n/arb/`.

## Run and build

```sh
flutter run -d chrome
flutter build web --release
```

The build goes to `build/web`. The app uses path URLs, so whatever serves it must rewrite unknown paths to `index.html` (the `firebase/firebase.json` hosting config already does).

## Data source

The container binds one `PortfolioDataSource` per environment. The default reads the bundled JSON; `--dart-define=DATA_SOURCE=api` binds the Cloud Functions client instead (`AppEnvironment` in `lib/di/environment.dart`). The command cheat sheet always comes from the assets.

## Checks

```sh
flutter analyze
flutter test
(cd package/domain && dart test)
(cd package/data && flutter test)
```

## Content

Texts, projects, skills and contacts live in `package/data/assets/data/en/*.json` and `uk/*.json`; UI strings in the ARB files. Screenshots and the avatar are hosted in `SERDUN/res_media_screenshots`.
