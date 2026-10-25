# Build context is the repository root: the server depends on package/contract.
FROM dart:3.13 AS build
WORKDIR /app
COPY package/contract/ package/contract/
COPY server/pubspec.yaml server/
RUN cd server && dart pub get
COPY server/ server/
RUN cd server && dart pub get --offline && dart compile exe bin/server.dart -o bin/server

FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/server/bin/server /app/bin/server
EXPOSE 8080
CMD ["/app/bin/server"]
