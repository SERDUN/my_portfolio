# my_portfolio

Personal portfolio of Dmytro Serdun, a Flutter web app: https://serdun.online/

## Layout

| Path | What it is |
|---|---|
| `lib/` | the app: `bootstrap.dart`, routing and theme in `app/`, screens in `features/`, shared widgets in `core/`, l10n in `localization/` |
| `package/domain/` | pure Dart: entities, repository contracts, use cases; depends on nothing but `injectable` |
| `package/contract/` | pure Dart: the JSON DTOs of the content, shared by the app, the content API and the sync |
| `package/data/` | DTO → model mappers (`lib/extension/`), data sources, repository implementations, the pulled JSON content under `assets/data/{en,uk}/` |
| `docs/` | `widgets.md`: the catalogue of shared widgets in `lib/core/widgets/` |
| `web/` | web shell: `index.html`, manifest, icons |
| `server/` | the content API (Dart, shelf, PostgreSQL) for Railway and the content pull/push CLI |
| `firebase/` | Firebase Hosting config of the site |

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

The container binds one `PortfolioDataSource` per environment. The default reads the bundled JSON; `--dart-define=DATA_SOURCE=api --dart-define=API_URL=https://<api>` reads the content API at runtime instead, with the bundled JSON as the fallback (`AppEnvironment` in `lib/di/environment.dart`). The command cheat sheet always comes from the assets.

## Checks

```sh
flutter analyze
flutter test
(cd package/domain && dart test)
(cd package/contract && dart test)
(cd package/data && flutter test)
(cd server && dart test)
```

GitHub Actions runs the same on every pull request (`.github/workflows/checks.yml`).

## Content

The content (texts, experience, projects, skills, contacts, commands) lives in the content API, `server/`: a Dart service on Railway that keeps one JSON document per kind and language in PostgreSQL and checks it against the DTOs in `package/contract` (see `server/README.md`). The site does not call the API at runtime. The deploy pulls it into `package/data/assets/data/<en|uk>/*.json` and builds from there, so the committed JSON is the last pulled copy and the fallback when no API is configured. UI strings stay in the ARB files. Screenshots and the avatar are hosted in `SERDUN/res_media_screenshots`.

```sh
cd server
dart run bin/content.dart pull --api https://<api>                          # API -> assets
PORTFOLIO_API_TOKEN=... dart run bin/content.dart push --api https://<api>  # assets -> API
```

## Deploy

`.github/workflows/deploy.yml` runs on every push to `master`, by hand, and on a `content-updated` repository dispatch: pull the content from `PORTFOLIO_API_URL` (repository variable), test, `flutter build web --release`, publish `build/web` to Firebase Hosting (`firebase/`, project `portfolio-f2eb7`) with the `FIREBASE_SERVICE_ACCOUNT` secret.
