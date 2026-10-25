# Portfolio content API

The source of the portfolio content: one JSON document per kind (`user`,
`skills`, `contacts`, `projects`, `commands`) and language (`en`, `uk`),
stored in PostgreSQL and validated against the DTOs in `package/contract`.
The site does not call it at runtime: the deploy pulls the content into
`package/data/assets/data` and builds from there.

## Endpoints

| Method | Path | |
|---|---|---|
| GET | `/health` | `ok` |
| GET | `/v1/<kind>?lang=en` | one document; `Accept-Language` works too, `en` by default |
| GET | `/v1/projects/<id>?lang=en` | one project |
| GET | `/v1/bundle?lang=en` | every kind of one language, keyed by kind |
| PUT | `/v1/<kind>?lang=en` | replace a document; `Authorization: Bearer $ADMIN_TOKEN`, `422` when it breaks the contract |

## Run

```sh
dart pub get
ADMIN_TOKEN=dev dart run bin/server.dart            # in-memory store
DATABASE_URL=postgresql://... dart run bin/server.dart
```

Environment: `PORT` (8080), `DATABASE_URL` (`?sslmode=disable|require`;
off on `*.railway.internal`, required elsewhere), `ADMIN_TOKEN` (no token
means read-only).

## Content CLI

```sh
dart run bin/content.dart pull --api https://<api>            # API -> ../package/data/assets/data
PORTFOLIO_API_TOKEN=... dart run bin/content.dart push --api https://<api>   # assets -> API
```

`pull` writes nothing unless every kind of every language is present and valid.

## Deploy

Railway builds `server/Dockerfile` with the repository root as context
(`railway.json`), health check `/health`.

## Tests

```sh
dart test                                                  # in-memory store and a socket round trip
TEST_DATABASE_URL=postgresql://... dart test               # plus the PostgreSQL store
```
