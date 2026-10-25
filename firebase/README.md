# Firebase Hosting

Hosting config of the site (project `portfolio-f2eb7`, served at
https://serdun.online). It serves the Flutter build from `../build/web` and
rewrites every path to `index.html`.

The content no longer comes from Cloud Functions: it lives in the content
API (`../server`) and is pulled into the app assets at deploy time. The
deploy runs in GitHub Actions (`.github/workflows/deploy.yml`); by hand:

```sh
flutter build web --release        # from the repository root
cd firebase && firebase deploy --only hosting
```
