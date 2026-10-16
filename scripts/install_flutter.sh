#!/usr/bin/env bash
set -euo pipefail

FLUTTER_DIR="$PWD/.flutter-sdk"

if [ ! -d "$FLUTTER_DIR/bin" ]; then
  echo "Installing Flutter SDK..."
  git clone --depth 1 --branch stable https://github.com/flutter/flutter.git "$FLUTTER_DIR"
fi

export PATH="$FLUTTER_DIR/bin:$PATH"
flutter --version
flutter config --enable-web
flutter pub get
