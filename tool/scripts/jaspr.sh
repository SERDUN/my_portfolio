#!/usr/bin/env bash
#
# Runs the Jaspr presenter (apps/jaspr) with a Dart it accepts.
#
# jaspr_cli refuses a `dart` that does not sit inside an SDK directory
# ("failed to verify the surrounding Dart SDK"), and a Homebrew install puts a
# shim at /opt/homebrew/bin/dart. The script resolves the real SDK bin from
# `flutter` and puts it first on PATH, so a laptop and a CI runner behave the
# same.
#
# apps/jaspr has its own resolution (see its pubspec), so the root
# `flutter pub get` does not resolve it; every command here runs its
# `dart pub get` first.
#
# `build` gets a free port: the pre-render pass starts a real server, 8080 by
# default, and fails late and opaquely when the port is taken.
#
# Usage: tool/scripts/jaspr.sh build|serve|test|analyze [args]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

# `readlink -f` is GNU-only; walk the symlink chain by hand for macOS.
resolve() {
  local target="$1" link
  while [[ -L "$target" ]]; do
    link="$(readlink "$target")"
    if [[ "$link" == /* ]]; then target="$link"; else target="$(dirname "$target")/$link"; fi
  done
  printf '%s\n' "$target"
}

if [[ $# -eq 0 ]]; then
  echo "usage: $0 build|serve|test|analyze [args]" >&2
  exit 64
fi

flutter_bin="$(command -v flutter)" || {
  echo "x flutter not found on PATH" >&2
  exit 1
}
sdk_bin="$(cd "$(dirname "$(resolve "$flutter_bin")")" && pwd)"
export PATH="$sdk_bin:$PATH"

cd "$ROOT/apps/jaspr"
dart pub get >/dev/null

case "$1" in
  test) exec dart test "${@:2}" ;;
  analyze) exec dart analyze --fatal-infos "${@:2}" ;;
esac

args=("$@")
if [[ "$1" == 'build' && " $* " != *' --port'* ]]; then
  args+=(--port "$(python3 -c 'import socket; s = socket.socket(); s.bind(("", 0)); print(s.getsockname()[1]); s.close()')")
fi
exec dart run jaspr_cli:jaspr "${args[@]}"
