#!/usr/bin/env bash
#
# Guards the declared dependencies of the packages that must compile to
# JavaScript without Flutter.
#
# The Jaspr presenter (apps/jaspr) compiles to JavaScript, and a `flutter`
# dependency anywhere under it drags in `dart:ui`, which dart2js cannot
# compile; the failure would surface only at the end of a web build. So the
# presenter and every pure package it stands on must not declare `flutter`,
# `flutter_test` or any other SDK package of Flutter.
#
# A web-clean package may reach other packages of this repository only if they
# are web-clean too: a `path:` dependency on package/data, which still declares
# `flutter`, would drag it in through the back door.
#
# Nothing may depend on a presenter either: the two presenters do not know
# about each other, so what both need lives in a shared package.
#
# Both `dependencies` and `dev_dependencies` are checked.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"

# Packages that must stay free of Flutter. package/data joins the list once its
# asset loading moves behind an interface.
WEB_CLEAN=(apps/jaspr package/domain package/contract)

# Every pubspec in the repository, so a new package is covered without being
# listed here.
ALL_PUBSPECS=()
while IFS= read -r pubspec; do ALL_PUBSPECS+=("$pubspec"); done < <(git ls-files --cached --others --exclude-standard -- 'pubspec.yaml' '*/pubspec.yaml')
PRESENTERS='my_portfolio|my_portfolio_jaspr'

failed=0
fail() {
  printf '  x %s\n' "$1"
  failed=1
}

# Prints the keys declared under `dependencies:` and `dev_dependencies:`.
declared() {
  awk '
    /^[^ #][^:]*:/ { section = $1; next }
    (section == "dependencies:" || section == "dev_dependencies:") && /^  [a-zA-Z_][a-zA-Z0-9_]*:/ {
      key = $1; sub(":", "", key); print key
    }
  ' "$1"
}

# Prints `sdk: flutter` entries, whatever the package is called.
flutter_sdk_deps() {
  awk '
    /^[^ #][^:]*:/ { section = $1; next }
    (section == "dependencies:" || section == "dev_dependencies:") && /^  [a-zA-Z_][a-zA-Z0-9_]*:/ {
      key = $1; sub(":", "", key)
      if ($0 ~ /sdk: *flutter/) print key
      next
    }
    (section == "dependencies:" || section == "dev_dependencies:") && /^    sdk: *flutter/ { print key }
  ' "$1"
}

for dir in "${WEB_CLEAN[@]}"; do
  pubspec="$dir/pubspec.yaml"
  [[ -f "$pubspec" ]] || { fail "$pubspec is missing"; continue; }
  while read -r dep; do
    [[ -n "$dep" ]] && fail "$pubspec declares the Flutter SDK package '$dep'"
  done < <(flutter_sdk_deps "$pubspec")
  while read -r dep; do
    [[ "$dep" == flutter* ]] && fail "$pubspec declares '$dep', a Flutter package"
  done < <(declared "$pubspec")
done

# Prints `<name> <path>` for every `path:` dependency, nested or inline.
path_deps() {
  awk '
    /^[^ #][^:]*:/ { section = $1; next }
    section != "dependencies:" && section != "dev_dependencies:" { next }
    /^  [a-zA-Z_][a-zA-Z0-9_]*:/ {
      key = $1; sub(":", "", key)
      if (match($0, /path: *[^ ,}]+/)) { v = substr($0, RSTART, RLENGTH); sub(/path: */, "", v); print key, v }
      next
    }
    /^    path:/ { v = $2; print key, v }
  ' "$1"
}

is_web_clean() {
  local dir
  for dir in "${WEB_CLEAN[@]}"; do [[ "$1" == "$dir" ]] && return 0; done
  return 1
}

for dir in "${WEB_CLEAN[@]}"; do
  pubspec="$dir/pubspec.yaml"
  [[ -f "$pubspec" ]] || continue
  while read -r name path; do
    [[ -n "$name" ]] || continue
    target="$(cd "$dir/$path" 2>/dev/null && pwd)" || { fail "$pubspec: path of '$name' does not exist ($path)"; continue; }
    target="${target#"$ROOT"/}"
    is_web_clean "$target" || fail "$pubspec depends on '$name' ($target), which is not web-clean"
  done < <(path_deps "$pubspec")
done

for pubspec in "${ALL_PUBSPECS[@]}"; do
  [[ -f "$pubspec" ]] || continue
  own="$(awk '/^name:/ { print $2; exit }' "$pubspec")"
  while read -r dep; do
    if [[ "$dep" != "$own" && "$dep" =~ ^($PRESENTERS)$ ]]; then
      fail "$pubspec depends on the presenter '$dep'"
    fi
  done < <(declared "$pubspec")
done

if [[ $failed -ne 0 ]]; then
  echo 'layer-deps-check: failed' >&2
  exit 1
fi
echo "layer-deps-check: OK (${#WEB_CLEAN[@]} web-clean packages, ${#ALL_PUBSPECS[@]} pubspecs)"
