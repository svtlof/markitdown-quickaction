#!/bin/zsh
set -e

REPO_URL="https://github.com/svtlof/markitdown-quickaction.git"
TMP_DIR="$(mktemp -d)"

git clone --depth 1 "$REPO_URL" "$TMP_DIR" --quiet

cd "$TMP_DIR"
chmod +x install.sh
./install.sh

rm -rf "$TMP_DIR"

echo "Downloaded"
