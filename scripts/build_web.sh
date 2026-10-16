#!/usr/bin/env bash
set -euo pipefail

if [ -d "$PWD/.flutter-sdk/bin" ]; then
  export PATH="$PWD/.flutter-sdk/bin:$PATH"
elif command -v flutter >/dev/null 2>&1; then
  export PATH="$(dirname "$(command -v flutter)"):$PATH"
else
  echo "Flutter SDK not found. Install Flutter or run the install script first."
  exit 1
fi

flutter config --enable-web
flutter pub get
flutter build web --release
